#!/usr/bin/python
"""
This bot downloads a specified wiki page to disk.

This script supports the following command line parameters:

    -pagename:#     The name of the page (e.g. Module:Weapons)

    -storepath:#    The stored file's path.
"""

import binascii
import os.path

from os import remove, replace, symlink, urandom

import pywikibot

from pywikibot.backports import Tuple
from pywikibot import Bot
from pywikibot.comms.http import fetch


class DownloadPageBot(Bot):

    """Download page bot."""

    available_options = {
        'wikiname': '',
        'filename': '',
        'storepath': './',
    }

    def convert_from_bytes(self, total_bytes):
        for unit in ['B', 'K', 'M', 'G', 'T']:
            if abs(self.total_bytes) < 1024:
                return str(total_bytes) + unit
            self.total_bytes = float(format(self.total_bytes / 1024.0, '.2f'))
        return str(self.total_bytes) + 'P'

    def run(self):
        """Run bot."""
        pywikibot.output('Downloading dump from ' + self.opt.wikiname)

        download_filename = '{wikiname}-{dumpdate}-{filename}'.format_map(
            self.opt)
        temp_filename = download_filename + '-' + \
            binascii.b2a_hex(urandom(8)).decode('ascii') + '.part'

        file_final_storepath = os.path.join(
            self.opt.storepath, download_filename)
        file_current_storepath = os.path.join(
            self.opt.storepath, temp_filename)

        # https://wikitech.wikimedia.org/wiki/Help:Toolforge#Dumps
        toolforge_dump_filepath = self.get_dump_name(
            self.opt.wikiname, self.opt.filename, self.opt.dumpdate)

        # First iteration for atomic download with temporary file
        # Second iteration for fallback non-atomic download
        for non_atomic in range(2):
            try:
                if toolforge_dump_filepath:
                    pywikibot.output('Symlinking file from '
                                     + toolforge_dump_filepath)
                    if non_atomic:
                        if os.path.exists(file_final_storepath):
                            remove(file_final_storepath)
                    symlink(toolforge_dump_filepath, file_current_storepath)
                else:
                    url = 'https://dumps.wikimedia.org/{}/{}/{}'.format(
                        self.opt.wikiname, self.opt.dumpdate,
                        download_filename)
                    pywikibot.output('Downloading file from ' + url)
                    response = fetch(url, stream=True)

                    if response.status_code != 200:
                        if response.status_code == 404:
                            pywikibot.output(
                                'File with name {filename!r}, from dumpdate '
                                '{dumpdate!r}, and wiki {wikiname!r} ({url}) '
                                "isn't available in the Wikimedia Dumps"
                                .format(url=url, **self.opt))
                        return

                    with open(file_current_storepath, 'wb') as result_file:
                        total = int(response.headers['content-length'])
                        if total == -1:
                            pywikibot.warning("'content-length' missing in "
                                              'response headers')
                        downloaded = 0
                        parts = 50
                        display_string = ''

                        pywikibot.output('')
                        for data in response.iter_content(100 * 1024):
                            result_file.write(data)

                            if total <= 0:
                                continue

                            downloaded += len(data)
                            done = int(parts * downloaded / total)
                            display = map(self.convert_from_bytes,
                                          (downloaded, total))
                            prior_display = display_string
                            display_string = '\r|{}{}|{}{}/{}'.format(
                                '=' * done,
                                '-' * (parts - done),
                                ' ' * 5,
                                *display)
                            # Add whitespace to cover up prior bar
                            display_string += ' ' * (
                                len(prior_display.rstrip())
                                - len(display_string.rstrip()))

                            pywikibot.output(display_string, newline=False)
                        pywikibot.output('')

                # Rename the temporary file to the target file
                # if the download completes successfully
                if not non_atomic:
                    replace(file_current_storepath, file_final_storepath)
                    break

            except (OSError, IOError):
                pywikibot.exception()

                try:
                    remove(file_current_storepath)
                except (OSError, IOError):
                    pywikibot.exception()

                # If the atomic download fails, try without a temporary file
                # If the non-atomic download also fails, exit the script
                if non_atomic:
                    return

                pywikibot.output('Cannot make temporary file, '
                                 'falling back to non-atomic download')
                file_current_storepath = file_final_storepath

        pywikibot.output('Done! File stored as ' + file_final_storepath)


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

    site = pywikibot.Site()
    opts['wikiname'] = site.dbName()

    bot = DownloadPageBot(**opts)
    bot.run()


if __name__ == '__main__':
    main()
