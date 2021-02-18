from pywikibot import family

# The WARFRAME wiki family, for the video game WARFRAME by Digital Extremes

class Family(family.Family):
    name = 'warframe'

    # All available languages are listed here.
    langs = {
        'en': 'warframe.fandom.com',
        'de': 'warframe.fandom.com/de',
        'es': 'warframe.fandom.com/es',
        'fr': 'warframe.fandom.com/fr',
        'hu': 'warframe.fandom.com/hu',
        'it': 'warframe.fandom.com/it',
        'ja': 'warframe.fandom.com/ja',
        'ko': 'warframe.fandom.com/ko',
        'nl': 'warframe.fandom.com/nl',
        'pl': 'warframe.fandom.com/pl',
        'pt-br': 'warframe.fandom.com/pt-br',
        'ru': 'warframe.fandom.com/ru',
        'tr': 'warframe.fandom.com/tr',
        'uk': 'warframe.fandom.com/uk',
        'vi': 'warframe.fandom.com/vi',
        'zh': 'warframe.huijiwiki.com',
        'zh-tw': 'warframe.fandom.com/zh-tw'
    }

    # A few selected big languages for things that we do not want to loop over  
    # all languages. This is only needed by the titletranslate.py module, so
    # if you carefully avoid the options, you could get away without these
    # for another wiki family.
    languages_by_size = ['en']

    def path(self, code):
        return '/index.php'

    # The MediaWiki version used.
    def version(self, code):
        if code == 'zh':
            return "1.30.0"
        return "1.33.3"

    # The relative path of index.php and api.php.
    def scriptpath(self, code):
        return ''

    def protocol(self, code):
        return 'HTTPS'
