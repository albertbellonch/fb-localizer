require 'fb-localizer/railtie' if defined? Rails
require 'i18n'

module FbLocalizer
  module FbLocalizerHelpers
    def get_fb_locale(ruby_locale = nil)
      ruby_locale ||= I18n.locale
      fb_candidate_locales = FbLocalizer::FbLocalizerHelpers::FB_LOCALES.select{ |l| l.match(/^#{ruby_locale}/)}
      if fb_candidate_locales.any?
        fb_candidate_locales[0]
      else
        "en_US"
      end
    end
  end
end

ActionView::Base.send(:include, FbLocalizer::FbLocalizerHelpers)
