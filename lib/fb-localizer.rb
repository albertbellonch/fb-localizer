require 'fb-localizer/railtie' if defined? Rails
require 'i18n'

module FbLocalizer
  DEFAULT_PRIORITIES = { :en => "en_US", :es => "es_ES", :pt => "pt_PT", :zh => "zh_CN" }
  mattr_accessor :priorized

  @@skip_loading = false
  @@skip_loading = true if defined?(Rails) && Rails.env.development?
  mattr_accessor :skip_loading

  module FbLocalizerHelpers
    def get_fb_locale(ruby_locale = nil)
      ruby_locale ||= I18n.locale
      ruby_locale = ruby_locale.to_sym if ruby_locale.is_a? String

      candidates = FbLocalizer::FbLocalizerHelpers::FB_LOCALES.select{ |l| l.match(/^#{ruby_locale}/)}
      return "en_US" if candidates.empty? # return American English if no candidates at all

      priorized = FbLocalizer.priorized[ruby_locale] # get priorized locale for that one
      if priorized && candidates.include?(priorized) # if available, get that one
        priorized
      else # if not, just get the first available
        candidates.first
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
