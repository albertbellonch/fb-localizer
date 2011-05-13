FB Localizer
======

Description
-----------

Facebook Localizer is a simple gem which converts from Ruby's locale to the
nearest Facebook's locale. Ruby's locales only include the language
information (not the region), but Facebook does. Also, Facebook supports only a subset of all languages in the world.

So, if we want to add a localized "I like it" button into our web page, we need a tool to convert from one to the other.

Note: a more complex algorithm on planning which is the nearest locale
is planned.

Priority locales
----------------

FB-Localizer has, from version 0.1.3, the ability to allow the user to
set priorities to certain locales.

If you try to convert "en" (for English) to a Facebook-compatible locale, you will find out that many are available: Pirate, Upside down, United States, and Great Britain. With this priority-locales feature you can indicate FB-Localizer to, in case of having English ("en") to translate, use directly, for example, the English's Great Britain locale.

Just create an initializer in app/initializers/, and set something like:

    FbLocalizer.configure do |config|
      config.priorized = { :en => "en_GB" }
    end

The format of the priorized locales is a hash. For each record in the hash:
* The key is the symbol for the locale, e.g :en or :es
* The value is your priorized Facebook locale for it, e.g. "en_US" for
  :en or "es_ES" for :es

Nevertheless, FB-Localizer itself has default locales for a ruby locale. The complete list is:
* United States' english
* Spain's spanish
* Portugal's portuguese
* Simplified chinese

The complete list of Facebook locales is in a XML provided by Facebook
itself: [complete list of Facebook locales](http://www.facebook.com/translations/FacebookLocales.xml)

Usage
-----

Let's see an example. Say you have a little HAML snippet which loads
Facebook's "I like it" script and shows one. Instead of hardcoding the
locale, as in here:

    %script{:src => "http://connect.facebook.net/en_US/all.js#xfbml=1"}
    %fb:like{:href => request.url, :layout => "button_count", :show_faces => "true"}

You can use this gem to automatically get the adequate extended locale from the
current locale (example, from "en" to "en_US" or from "ca" to "ca_ES"):

    %script{:src => "http://connect.facebook.net/#{get_fb_locale(I18n.locale)}/all.js#xfbml=1"}
    %fb:like{:href => request.url, :layout => "button_count", :show_faces => "true"}

Installation
------------

Simply add this gem to your Gemfile...

    ...
    gem "fb-localizer"
    ...

...and execute "bundle".
