$:.push File.expand_path("../lib", __FILE__)

require "manageiq/providers/yarn/version"

Gem::Specification.new do |s|
  s.name        = "manageiq-providers-yarn"
  s.version     = ManageIQ::Providers::Yarn::VERSION
  s.authors     = ["ManageIQ Developers"]
  s.homepage    = "https://github.com/aljesusg/manageiq-providers-yarn"
  s.summary     = "Yarn Provider for ManageIQ"
  s.description = "Yarn Provider for ManageIQ"
  s.licenses    = ["Apache-2.0"]

  s.files = Dir["{app,config.lib}/**/*"]

#  s.add_dependency "azure-armrest", "=0.5.2"

  s.add_development_dependency "codeclimate-test-reporter", "~> 1.0.0"
  s.add_development_dependency "simplecov"
end
