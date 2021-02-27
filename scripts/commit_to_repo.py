#!/usr/bin/python
"""
Looks into the bot's watchlist for recent changes and persist those changes to a GitHub repo.
Only considering pages in the Main, MediaWiki, Template, and Module namespaces
Must be logged in to run; type python pwb.py login
"""
import pywikibot
import urllib
from datetime import datetime, timedelta

def get_watched_pages(site):
    time = (datetime.utcnow()- timedelta(days=7)).isoformat()
    print(time)
    watchlist = site.watchlist_revs(end=time, namespaces='0|8|10|14|828')
    for page in watchlist:
        print(page)

def create_pull_request():


def main(*args):
    """
    Process command line arguments and invoke bot.

    @param args: command line arguments
    @type args: str
    """
    site = pywikibot.Site()
    get_watched_pages(site)


if __name__ == '__main__':
    main()