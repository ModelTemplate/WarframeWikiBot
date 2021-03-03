#!/usr/bin/python
"""
This is a script written to add the template "delete" to pages that are not linked anywhere else.
It is the modified version of lonelypages.py for use on the WARFRAME wiki.

These command line parameters can be used to specify which pages to work on:

&params;

Furthermore, the following command line parameters are supported:

-enable:          Enable or disable the bot via a Wiki Page.

-disambig:        Set a page where the bot saves the name of the disambig
                  pages found (default: skip the pages)

-always           Always say yes, won't ask


Example:

    python pwb.py unlinked_pages -enable:User:Bot/CheckBot -always
"""
#
# (C) Pywikibot team, 2006-2020
#
# Distributed under the terms of the MIT license.
#
import re
import sys

import pywikibot
from pywikibot import i18n, pagegenerators
from pywikibot.bot import suggest_help, SingleSiteBot

# This is required for the text that is shown when you run this script
# with the parameter -help.
docuReplacements = {'&params;': pagegenerators.parameterHelp}  # noqa: N816


class OrphanTemplate:

    """The orphan template configuration."""

    def __init__(self, site, name, parameters, aliases=None, subst=False):
        """Initializer."""
        self._name = name
        if not aliases:
            aliases = []
        elif not subst:
            aliases = list(aliases) + [name]
        else:
            name = 'subst:' + name
        if parameters:
            name += '|' + parameters
        self.template = '{{' + name + '}}'
        self._names = frozenset(aliases)

        template_ns = site.namespaces[10]
        # TODO: Add redirects to self.names too
        if not pywikibot.Page(site, self._name, template_ns.id).exists():
            raise ValueError('Orphan template "{0}" does not exist on '
                             '"{1}".'.format(self._name, site))
        for name in self._names:
            if not pywikibot.Page(site, name, template_ns.id).exists():
                pywikibot.warning('Orphan template alias "{0}" does not exist '
                                  'on "{1}"'.format(name, site))
        self.regex = re.compile(
            r'\{\{(?:'
            + ':|'.join(template_ns) + '|)('
            + '|'.join(re.escape(name) for name in self._names)
            + r')[\|\}]', re.I)


# The orphan template names in the different languages.
_templates = {
    'en': ('Delete', 'Marked for deletion by bot on {{subst:CURRENTMONTHNAME}} {{subst:CURRENTYEAR}}',
           ['wi']),
}


class LonelyPagesBot(SingleSiteBot):

    """Orphan page tagging bot."""

    def __init__(self, generator, **kwargs):
        """Initializer."""
        self.available_options.update({
            'enablePage': None,    # Check if someone set an enablePage or not
            'disambigPage': None,  # If no disambigPage given, not use it.
        })
        super().__init__(**kwargs)
        self.generator = generator

        # Take the configurations according to our project
        if self.opt.enablePage:
            self.opt.enablePage = pywikibot.Page(
                self.site, self.opt.enablePage)
        self.comment = i18n.twtranslate(
            self.site, 'lonelypages-comment-add-template')
        self.commentdisambig = i18n.twtranslate(
            self.site, 'lonelypages-comment-add-disambig-template')
        orphan_template = i18n.translate(self.site, _templates)
        if orphan_template is not None:
            try:
                orphan_template = OrphanTemplate(self.site, *orphan_template)
            except ValueError as e:
                orphan_template = e
        if orphan_template is None or isinstance(orphan_template, ValueError):
            err_message = 'Missing configuration for site {}'.format(self.site)
            suggest_help(
                exception=orphan_template, additional_text=err_message)
            sys.exit(err_message)
        else:
            self._settings = orphan_template
        # DisambigPage part
        if self.opt.disambigPage is not None:
            self.disambigpage = pywikibot.Page(
                self.site, self.opt.disambigPage)
            try:
                self.disambigtext = self.disambigpage.get()
            except pywikibot.NoPage:
                pywikibot.output("{0} doesn't exist, skip!"
                                 .format(self.disambigpage.title()))
                self.disambigtext = ''
            except pywikibot.IsRedirectPage:
                pywikibot.output("{0} is a redirect, don't use it!"
                                 .format(self.disambigpage.title()))
                self.opt.disambigPage = None

    @property
    def settings(self):
        """Return the settings for the configured site."""
        return self._settings

    def enable_page(self):
        """Enable or disable bot via wiki page."""
        enable = self.opt.enablePage
        if enable is not None:
            try:
                getenable = enable.get()
            except pywikibot.NoPage:
                pywikibot.output(
                    "{0} doesn't exist, I use the page as if it was blank!"
                    .format(enable.title()))
                getenable = ''
            except pywikibot.IsRedirectPage:
                pywikibot.output('{0} is a redirect, skip!'
                                 .format(enable.title()))
                getenable = ''
            return getenable == 'enable'
        return True

    def setup(self):
        """Setup the bot.

        If the enable page is set to disable, set an empty generator which
        turns off the bot (useful when the bot is run on a server).
        """
        if not self.enable_page():
            pywikibot.output('The bot is disabled')
            self.generator = ()

    def treat(self, page):
        """Check if page is applicable and not marked and add template then."""
        pywikibot.output('Checking {0}...'.format(page.title()))
        if page.isRedirectPage():  # If redirect, skip!
            pywikibot.output('{0} is a redirect! Skip...'
                             .format(page.title()))
            return
        refs = list(page.getReferences(total=1))
        if len(refs) > 0:
            pywikibot.output("{0} isn't orphan! Skip..."
                             .format(page.title()))
            return
        # Check if page has categories
        elif sum(1 for _ in page.categories()) > 0:
            pywikibot.output('{0} has categories, skip...'
                    .format(page.title()))
            return
        else:
            # no refs, no redirect; check if there's already the template
            try:
                oldtxt = page.get()
            except pywikibot.NoPage:
                pywikibot.output("{0} doesn't exist! Skip..."
                                 .format(page.title()))
                return
            except pywikibot.IsRedirectPage:
                pywikibot.output('{0} is a redirect! Skip...'
                                 .format(page.title()))
                return
            if self.settings.regex.search(oldtxt):
                pywikibot.output(
                    'Your regex has found something in {0}, skipping...'
                    .format(page.title()))
                return
            if (page.isDisambig()
                    and self.opt.disambigPage is not None):
                pywikibot.output('{0} is a disambig page, report..'
                                 .format(page.title()))
                if not page.title().lower() in self.disambigtext.lower():
                    self.disambigtext = '{0}\n*[[{1}]]'.format(
                        self.disambigtext, page.title())
                    self.disambigpage.text = self.disambigtext
                    self.disambigpage.save(self.commentdisambig)
                    return
            # Is the page a disambig but there's not disambigPage? Skip!
            elif page.isDisambig():
                pywikibot.output('{0} is a disambig page, skip...'
                                 .format(page.title()))
                return
            else:
                # Ok, the page need the template. Let's put it there!
                # Adding the template in the text
                newtxt = '{0}\n{1}'.format(self.settings.template, oldtxt)
                self.userPut(page, oldtxt, newtxt, summary=self.comment)


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

    # If the generator is not given, use the default one
    if not generator:
        generator = site.lonelypages(total=gen_factory.limit)

    bot = LonelyPagesBot(generator, **options)
    bot.run()


if __name__ == '__main__':
    main()
