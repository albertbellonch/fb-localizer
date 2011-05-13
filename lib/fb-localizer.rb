require 'fb-localizer/railtie' if defined? Rails
require 'i18n'

module FbLocalizer
  DEFAULT_PRIORITIES = { :en => "en_US", :es => "es_ES", :pt => "pt_PT", :zh => "zh_CN" }
  mattr_accessor :priorized

  module FbLocalizerHelpers
    def get_fb_locale(ruby_locale = nil)
      ruby_locale ||= I18n.locale
      fb_candidate_locales = FbLocalizer::FbLocalizerHelpers::FB_LOCALES.select{ |l| l.match(/^#{ruby_locale}/)}
      if fb_candidate_locales.any?
        priorized = FbLocalizer.priorized[ruby_locale] # get priorized locale for that one
        if priorized && fb_candidate_locales.include?(priorized) # if available, get that one
          priorized
        else # if not, just get the first available
          fb_candidate_locales[0]
        end
      else
        "en_US"
      end
    end
  end

  def self.configure
    yield self
  end

  def self.priorized
    DEFAULT_PRIORITIES.merge(@@priorized)
  end
end

ActionView::Base.send(:include, FbLocalizer::FbLocalizerHelpers)
