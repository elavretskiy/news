$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "news/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "news"
  s.version     = News::VERSION
  s.authors     = ["lavrik"]
  s.email       = ["e.lavretskiy@gmail.com"]
  s.homepage    = "http://vk.com/e.lavretskiy"
  s.summary     = "Summary of News."
  s.description = "Description of News."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.0"

  s.add_development_dependency "pg"

  s.add_dependency 'jquery-rails'
  s.add_dependency 'sass-rails'
  s.add_dependency 'bootstrap-sass'
  s.add_dependency "ckeditor"
  s.add_dependency "carrierwave"
  s.add_dependency "mini_magick"
  s.add_dependency "simple_form"
  s.add_dependency "responders"
  s.add_dependency 'kaminari'
  s.add_dependency 'routing-filter'
end
