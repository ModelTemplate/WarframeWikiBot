#!/usr/bin/python
"""
Looks into the bot's watchlist for recent changes and persist those page changes to a GitHub repo.
Only considering pages in the Main, MediaWiki, Template, and Module namespaces.
Must be logged in to run; type python pwb.py login
"""
import pywikibot
import urllib
from datetime import datetime, timedelta

def get_watched_pages(site):
    """
    Returns a dictionary of pageids and article titles
    """
    # latest changes since the past week
    time = (datetime.utcnow()- timedelta(days=7)).isoformat()
    latest_revisions = site.watchlist_revs(end=time, namespaces='0|8|10|14|828')
    latest_modified_pages = {}
    for revision in latest_revisions:
        latest_modified_pages.update({revision['pageid']: revision['title']})
    return latest_modified_pages


def get_page_contents(site):
    latest_modified_pages = get_watched_pages(site)
    pageids = ''
    for pageid in latest_modified_pages:
        pageids += str(pageid) + "|"
    pageids = pageids.rstrip('|')
    pages = site.load_pages_from_pageids(pageids)
    # not using site.get_parsed_page() since it does not get page content in its
    # original wikitext as of version 6.0.0 of the bot
    for page in pages:
        req = site._simple_request(action='parse', prop='wikitext', page=page)
        data = req.submit()
        unparsed_text = data['parse']['wikitext']['*']
        print(unparsed_text)

    return # site.get_parsed_page(page)


def create_pull_request():
    return


def main(*args):
    """
    Process command line arguments and invoke bot.

    @param args: command line arguments
    @type args: str
    """
    site = pywikibot.Site()
    get_page_contents(site)


if __name__ == '__main__':
    main()