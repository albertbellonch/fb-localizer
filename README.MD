NifVal
======

Description
-----------

Facebook Localizer is a simple gem which converts from Ruby's locale to the
nearest Facebook's locale. Ruby's locales only include the language
information (not the region), but Facebook does. Also, Facebook supports only a subset of all languages in the world.

So, if we want to add a localized "I like it" button into our web page, we need a tool to convert from one to the other.

Note: a more complex algorithm on planning which is the nearest locale
is planned.

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
