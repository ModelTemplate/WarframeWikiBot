#!/usr/bin/python
"""
This bot downloads a specified wiki page to disk.

This script supports the following command line parameters:

    -pagename:#     The name of the page (e.g. 'Module:Weapons')

    -storepath:#    The stored file's path.
"""

import os.path

import pywikibot
import re

from pywikibot.backports import Tuple
from pywikibot import Bot


class DownloadPageBot(Bot):

    """Download page bot."""

    available_options = {
        'site': '',
        'pagename': '',
        'storepath': './',
    }

    # Unused; may port this to download_dump.py in main repo
    @staticmethod
    def convert_from_bytes(total_bytes):
        """
        Performs a byte value conversion

        @param total_bytes: total bytes to be converted
        @type total_bytes: float
        """
        for unit in ['B', 'K', 'M', 'G', 'T']:
            if abs(total_bytes) < 1024:
                return str(total_bytes) + unit
            total_bytes = float(format(total_bytes / 1024.0, '.2f'))
        return str(total_bytes) + 'P'


    def get_page_contents(self, title):
        """
        Returns the wikitext of a page.

        @param site: the wiki that the bot is operating on
        @type site: pywikibot.site
        """
        # not using site.get_parsed_page() since it does not get page content in its
        # original wikitext as of version 6.0.0 of the bot
        req = self.opt.site._simple_request(action='parse', prop='wikitext', title=title)
        data = req.submit()
        return data['parse']['wikitext']['*']


    def write_page_to_file(self, page):
        """
        Writes page contents to disk.

        @param wikitext: page contents in wikitext
        @type wikitext: str
        """
        # TODO: use namespace id instead for wikis in other languages
        # TODO: update regex replacement for different namespaces
        filepath = self.opt.storepath
        title = self.opt.pagename
        if page.namespace() == 'Main:':
            filepath += 'main/' + re.sub('[:\/]', '-', title) + '.txt'
        elif page.namespace() == 'Module:':
            filepath += 'modules/' + re.sub('[:\/]', '-', title) + '.lua'
        elif page.namespace() == 'MediaWiki:':
            filepath += 'js/' + re.sub('[:\/]', '-', title) + '.js'
        elif page.namespace() == 'Template:':
            filepath += 'templates/' + re.sub('[:\/]', '-', title) + '.txt'
        else:
            raise Exception('The following namespace is not supported: ' + page.namespace())

        try:
            with open(filepath, 'w', encoding='utf-8') as file:
                file.write(self.get_page_contents(page.title()))
                file.close()

        except (OSError, IOError):
            pywikibot.exception()
    

    def run(self):
        """Run bot."""
        print(self.opt)
        pywikibot.output('Downloading page from ' + self.opt.site.dbName())

        wikitext = self.get_page_contents(self.opt.pagename)
        self.write_page_to_file(wikitext)

        pywikibot.output('Done! File stored as ' + self.opt.storepath)


def main(*args: Tuple[str, ...]):
    """
    Process command line arguments and invoke bot.

    If args is an empty list, sys.argv is used.

    @param args: command line arguments
    """
    opts = {}
    unknown_args = []

    local_args = pywikibot.handle_args(args)
    for arg in local_args:
        option, _, value = arg.partition(':')
        if option.startswith('-'):
            option = option[1:]

            if option == 'pagename':
                opts[option] = value or pywikibot.input('Enter the page name: ')
                continue

            if option == 'storepath':
                opts[option] = os.path.abspath(value) or pywikibot.input(
                    'Enter the store path: ')
                continue

        unknown_args.append(arg)

    missing = []
    if 'pagename' not in opts:
        missing.append('-pagename')

    if pywikibot.bot.suggest_help(missing_parameters=missing,
                                  unknown_parameters=unknown_args):
        return

    opts['site'] = pywikibot.Site()
    print(opts)
    bot = DownloadPageBot(**opts)
    bot.run()


if __name__ == '__main__':
    main()
