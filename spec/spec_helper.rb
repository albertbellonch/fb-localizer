# Require fb-localize and load server
ENV["RAILS_ENV"] = "test"
require File.expand_path('../../testapp/config/environment', __FILE__)
require 'rspec/rails'
require 'fb-localizer'
