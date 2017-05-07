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

  s.add_dependency "rails", "~> 5.0.2"
  s.add_dependency "audited"
  s.add_dependency "differ"

  s.add_development_dependency "sqlite3"
end
