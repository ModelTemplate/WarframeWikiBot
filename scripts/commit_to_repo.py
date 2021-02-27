#!/usr/bin/python
"""
Looks into the bot's watchlist for recent changes and persist those changes to a GitHub repo.
Only considering pages in the Main, MediaWiki, Template, and Module namespaces
Must be logged in to run; type python pwb.py login
"""
import pywikibot
import urllib

def get_watched_pages(site):
    watchlist = fetch_watchlist(site)
    for page in watchlist:
        print(page)

    site.watchlist_revs(namespaces='0|8|10|14|828')


def fetch_watchlist(site):
    # Fetch the watchlist.
    pywikibot.output('Retrieving watchlist for {0}.'.format(str(site)))
    watched_pages = list(site.watched_pages(force=True))
    return filter(filter_talk_page, watched_pages)


def filter_talk_page(page):
    # Filters talk pages
    talk_pages = ['User talk', 'Category talk', 'Module talk']
    if (page.namespace() in talk_pages):
        return False
    else:
        return True


def main(*args):
    """
    Process command line arguments and invoke bot.

    If args is an empty list, sys.argv is used.

    @param args: command line arguments
    @type args: str
    """
    site = pywikibot.Site()
    for key in site.namespaces:
        print(str(key) + ": " + str(site.namespaces[key]))

    get_watched_pages(site)


if __name__ == '__main__':
    main()