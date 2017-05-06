$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "audited_views/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "audited_views"
  s.version     = AuditedViews::VERSION
  s.authors     = ["Douglas Lise"]
  s.email       = ["douglaslise@gmail.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of AuditedViews."
  s.description = "TODO: Description of AuditedViews."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.1.0"

  s.add_development_dependency "sqlite3"
end
