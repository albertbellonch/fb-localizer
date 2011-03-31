require 'rails'
require 'fb-localizer'
require 'xml'

module FbLocalizer
  class Railtie < Rails::Railtie
    initializer "fb-localizer.configure_rails_initialization" do
      # Get locales
      url = "www.facebook.com/translations/FacebookLocales.xml"
      `wget -qO- #{url} >> tmp.xml`

      # Navigate and get locales
      FbLocalizer::FbLocalizerHelpers::FB_LOCALES = []
      fb_locales = XML::Document.file("tmp.xml")
      fb_locales.find('//locales/locale/codes/code/standard/representation').each do |node|
        FbLocalizer::FbLocalizerHelpers::FB_LOCALES << node.content
      end

      # Remove tmp file
      `rm tmp.xml`
    end
  end
end
