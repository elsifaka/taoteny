class WelcomeController < ApplicationController

  def index
    @content[:before_continuing] = {}
    @content[:before_continuing][:fre] = "Avant de commencer"
    @content[:before_continuing][:eng] = "Before continuing"
    @content[:before_continuing][:mg] = "Alohan'ny irosoana amin'ny lalindalina kokoa"
    @content[:choose_interface_language_code] = {}
    @content[:choose_interface_language_code][:fre] = "Choisir la langue de l'interface : "
    @content[:choose_interface_language_code][:eng] = "Choose your interface language : "
    @content[:choose_interface_language_code][:mlg] = "Fifidianana ny fiteny ampiasana ny vohikala : "
    @content[:choose_source_language_code] = {}
    @content[:choose_source_language_code][:fre] = "Choisir la langue source : "
    @content[:choose_source_language_code][:eng] = "Choose your source language : "
    @content[:choose_source_language_code][:mlg] = "Fifidianana ny fiteny iaingana : "
    @content[:choose_target_language_code] = {}
    @content[:choose_target_language_code][:fre] = "Choisir la langue d'arrivée : "
    @content[:choose_target_language_code][:eng] = "Choose your target language : "
    @content[:choose_target_language_code][:mlg] = "Fifidianana ny fiteny tanjona : "
    @content[:continue] = {}
    @content[:continue][:fre] = "Allons-y !"
    @content[:continue][:mlg] = "Andao ary !"
    @content[:continue][:eng] = "Let's go !"
    @content[:search] = {}
    @content[:search][:fre] = "Rechercher"
    @content[:search][:eng] = "Search"
    @content[:search][:mlg] = "Hikaroka"
    @content[:random_term] = {}
    @content[:random_term][:fre] = "Un terme au hasard"
    @content[:random_term][:mlg] = "Omeo patiny :-)"
    @content[:random_term][:fre] = "Random term"
    @content[:preferences] = {}
    @content[:preferences][:fre] = "Préférences"
    @content[:preferences][:mlg] = "Aratsafidy"
    @content[:preferences][:eng] = "Preferences"
    @content[:advanced_search] = {}
    @content[:advanced_search][:fre] = "Recherche Avancée"
    @content[:advanced_search][:eng] = "Advanced Search"
    @content[:advanced_search][:mlg] = "Fikarohana Mitsongo"
  end
  
  def about
    @content[:about] = {}
    @content[:about][:fre] = "
h2. À Propos

VM est avant tout un _mémoire de traduction_. Cet outil a été créé pour centraliser tous les essais de traductions de termes inexistants dans la langue malgache.

Nous espérons que grâce à cet outil, toutes les personnes travaillant dans les domaines où le vocabulaire spécialisé manque, pourront dorénavant partager leurs essais de traductions et pourront profiter des recherches faites par d'autres personnes.

Bon Surf !
    "
    @content[:about][:mlg] = "
h2. Mombamomba

VM dia vohikala natao itoeran'ny dikan-teny vaovao rehetra. Araka ny fombafomba web 2.0 dia afaka mandray anjara daholo ny olona rehetra, manome sosokevitra, mifidy izay vaombolana vaovao metimety amin'ny filàny.

Ny faniriana moa dia ny hampiasan'ny olona rehetra ity fitaovana ity ka tsy handaniana fotoana hamoronana voambolana vahiny efa nisy nanandrana nandika.

Izay angamba aloha no azo ambara, raha misy fanontaniana dia aza misalasala manoratra.

Mazotoa mandika teny e !
    "
    @content[:about][:eng] = "
h2. About

VM is a _translation memory_. Cet outil a été créé pour centraliser tous les essais de traductions de termes inexistants dans la langue malgache.

Nous espérons que grâce à cet outil, toutes les personnes travaillant dans les domaines où le vocabulaire spécialisé manque, pourront dorénavant partager leurs essais de traductions et pourront profiter des recherches faites par d'autres personnes.

Bon Surf !
    "
  end
  
  private
  def init_content
    super
    @content[:welcome] = {}
    @content[:welcome][:fre] = "Bienvenue sur VM"
    @content[:welcome][:mlg] = "Tongasoa eto amin'ny VM"
    @content[:welcome][:eng] = "Welcome on VM"
  end
end
