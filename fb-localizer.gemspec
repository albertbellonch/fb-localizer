# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "fb-localizer/version"

Gem::Specification.new do |s|
  s.name        = "fb-localizer"
  s.version     = Fb::Localizer::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Albert Bellonch"]
  s.email       = ["albert@itnig.net"]
  s.homepage    = "https://github.com/albertbellonch/fb-localizer"
  s.summary     = %q{Converts from Ruby's locale to the
nearest Facebook's locale.}
  s.description = %q{Converts from Ruby's locale to the
nearest Facebook's locale. This way you can localize the "I like it" button on every web page you want}

  s.rubyforge_project = "fb-localizer"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency "rspec-rails", "~> 2.5"
  s.add_dependency "rails"
  s.add_dependency "i18n"
  s.add_dependency "libxml-ruby", "1.1.3"
end
