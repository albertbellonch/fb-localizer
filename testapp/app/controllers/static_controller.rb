class StaticController < ApplicationController
  NAMES = {
    :en => "UK English", # default is US, but we priorize en_GB in app/initializers/fb-localizer.rb
    :es => "Spain's Spanish",
    :it => "Italian",
    :ca => "Catalan",
    :pt => "Portugal's Portuguese",
    :tl => "Klingon"
  }

  def index
    @locale = params[:locale] ? params[:locale].to_sym : I18n.locale
    @names = NAMES
  end
end
