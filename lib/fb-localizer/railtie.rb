require 'rails'
require 'fb-localizer'
require 'xml'
require "open-uri"
require "timeout"

module FbLocalizer
  class Railtie < Rails::Railtie
    initializer "fb-localizer.configure_rails_initialization" do
      begin
        Timeout::timeout(5) do
          url = "http://www.facebook.com/translations/FacebookLocales.xml"
          open(url){ |f|
            xml = f.readlines.join("\n")
            fb_locales = XML::Parser.string(xml).parse
            FbLocalizer::FbLocalizerHelpers::FB_LOCALES = []
            fb_locales.find('//locales/locale/codes/code/standard/representation').each do |node|
              FbLocalizer::FbLocalizerHelpers::FB_LOCALES << node.content
            end
            puts "FB-Localizer => Locales read successfully from <http://www.facebook.com/translations/FacebookLocales.xml>"
          }
        end
      rescue Exception => e
        puts "FB-Localizer => Exception '#{e}', using defaults instead"
        FbLocalizer::FbLocalizerHelpers::FB_LOCALES = ["en_US","es_ES","ca_ES"]
      end
    end
  end
end
