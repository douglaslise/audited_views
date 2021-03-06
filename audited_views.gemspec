$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "audited_views/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "audited_views"
  s.version     = AuditedViews::VERSION
  s.authors     = ["Douglas Lise"]
  s.email       = ["douglaslise@gmail.com"]
  s.homepage    = "http://github.com/douglaslise/audited_views"
  s.summary     = "Views and controls for audited records"
  s.description = "Views and controls for audited records"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails"
  s.add_dependency "audited"
  s.add_dependency "differ"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'capybara'
  s.add_development_dependency 'factory_girl_rails'

  s.test_files = Dir["spec/**/*"]
end
