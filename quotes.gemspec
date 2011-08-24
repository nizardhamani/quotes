# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "quotes/version"

Gem::Specification.new do |s|
  s.name        = "quotes"
  s.version     = Quotes::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Nizar Dhamani"]
  s.email       = ["nizar.dhamani@gmail.com"]
  s.homepage    = "https://github.com/nizardhamani/quotes"
  s.summary     = %q{A lightweight wrapper for the Yahoo stock quotes API.}
  s.description = %q{A lightweight wrapper for the Yahoo stock quotes API.}

  s.rubyforge_project = "quotes"
  
  s.add_development_dependency('rspec', '>= 2.0.0')

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
