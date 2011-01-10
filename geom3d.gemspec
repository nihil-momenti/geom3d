# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "geom3d/version"

Gem::Specification.new do |s|
  s.name        = "geom3d"
  s.version     = Geom3d::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Nemo157 (Wim Looman)"]
  s.email       = ["ghostunderscore@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{A simple pure ruby 3d geometry library}
  s.description = %q{TODO: Write a gem description}
  s.licenses    = ["Apache License 2.0"]

  s.rubyforge_project = "geom3d"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.required_ruby_version = '>1.9.2'

  s.add_development_dependency 'rspec', '~>2.3.0'
end
