#!/usr/bin/python
"""
Looks into the bot's watchlist for recent changes and persist those page changes to a GitHub repo.
Only considering pages in the Main, MediaWiki, Template, and Module namespaces.
Must be logged into bot account to run; type python pwb.py login
In addition, add a .txt file named github-pat.txt that contains the personal access token
to the GitHub account that owns the repos you want to commit changes to.
"""
import pywikibot
from pywikibot import pagegenerators
import urllib
import requests
import re
from datetime import datetime, timedelta

def get_watched_pages(site):
    """
    Returns a dictionary of pageids and article titles

    @param site: the wiki that the bot is operating on
    @type site: pywikibot.site
    """
    # latest changes since the past week
    time = (datetime.utcnow()- timedelta(days=7)).isoformat()
    latest_revisions = site.watchlist_revs(end=time, namespaces='0|8|10|14|828')
    latest_modified_pages = {}
    for revision in latest_revisions:
        latest_modified_pages.update({revision['pageid']: revision['title']})

    return latest_modified_pages


def get_page_contents(site):
    """
    Returns the wikitext of pages in the bot's watchlist

    @param site: the wiki that the bot is operating on
    @type site: pywikibot.site
    """
    latest_modified_pages = get_watched_pages(site)

    pageids = ''
    for pageid in latest_modified_pages:
        pageids += str(pageid) + '|'

    pageids = pageids.rstrip('|')
    pages = site.load_pages_from_pageids(pageids)
    pagelist = []
    # not using site.get_parsed_page() since it does not get page content in its
    # original wikitext as of version 6.0.0 of the bot
    for page in pages:
        req = site._simple_request(action='parse', prop='wikitext', page=page)
        data = req.submit()
        wikitext = data['parse']['wikitext']['*']
        # TODO: use namespace id instead for wikis in other languages
        # TODO: support for content in Main, MediaWiki, and Template namespace
        filepath = ''
        if page.namespace() == 'Main:':
            filepath = 'warframe/main' + re.sub('[:\/]', '-', page.title()) + '.txt'
        elif page.namespace() == 'Module:':
            filepath = 'warframe/modules' + re.sub('[:\/]', '-', page.title()) + '.lua'
        elif page.namespace() == 'MediaWiki:':
            filepath = 'warframe/js' + re.sub('[:\/]', '-', page.title()) + '.js'
        elif page.namespace() == 'Template:':
            filepath = 'warframe/templates' + re.sub('[:\/]', '-', page.title()) + '.txt'
            
        with open(filepath, 'w', encoding='utf-8') as file:
            file.write(wikitext)
            file.close()

        pagelist.append(wikitext)

    return pagelist

def auth_github_api(pages, apiurl):
    """
    Interfaces with GitHub REST API to upload contents of wiki articles to
    a repository.

    @param pages: contains Page objects of articles to be uploaded
    @param apiurl: API endpoint
    @type pages: list
    @param apiurl: str
    """
    # TODO: if deploying this bot to the cloud, may have to change how secrets are accessed
    pat = open('github-pat.txt', 'r').read()
    headers = {
        'accept': 'application/vnd.github.v3+json',
        'authorization': 'token ' + pat,
        'content-type': 'application/json;charset=utf-8'
    }
    params = {
        'title': 'Latest content on the wiki',
        'head': 'head',
        'base': 'main',
        'body': 'Automated update to the latest content on the wiki'
    }
    """
    application/vnd.github.VERSION.raw+json
    application/vnd.github.VERSION.text+json
    application/vnd.github.VERSION.html+json
    application/vnd.github.VERSION.full+json
    application/vnd.github.VERSION.diff
    application/vnd.github.VERSION.patch
    """
    payload = ''    # files go here
    response = requests.post(apiurl, headers=headers, params=params)
    print(response.text)


def create_pull_request():
    return


def main(*args):
    """
    Process command line arguments and invoke bot.

    If args is an empty list, sys.argv is used.

    @param args: command line arguments
    @type args: str
    """
    options = {}

    local_args = pywikibot.handle_args(args)
    gen_factory = pagegenerators.GeneratorFactory()
    site = pywikibot.Site()

    # TODO: update args
    for arg in local_args:
        if arg.startswith('-enable'):
            if len(arg) == 7:
                options['enablePage'] = pywikibot.input(
                    'Would you like to check if the bot should run or not?')
            else:
                options['enablePage'] = arg[8:]
        elif arg.startswith('-disambig'):
            if len(arg) == 9:
                options['disambigPage'] = pywikibot.input(
                    'In which page should the bot save the disambig pages?')
            else:
                options['disambigPage'] = arg[10:]
        elif arg == '-always':
            options['always'] = True
        else:
            gen_factory.handle_arg(arg)

    generator = gen_factory.getCombinedGenerator()

    apiurl = 'https://api.github.com/repos/ModelTemplate/warframe-wiki-modules/pulls'
    get_page_contents(site)
    auth_github_api(site, apiurl)


if __name__ == '__main__':
    main()
