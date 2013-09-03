# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "schoolfinder/version"

Gem::Specification.new do |s|
  s.name = %q{schoolfinder}
  s.authors = ["Tom Cocca"]
  s.date = %q{2011-10-16}
  s.description = %q{Ruby API wrapper for education.com schoolfinder built with httparty}
  s.email = %q{tom.cocca@gmail.com}
  s.homepage = %q{http://github.com/tcocca/schoolfinder}
  s.rdoc_options = ["--charset=UTF-8"]
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{ruby api wrapper for education.com schoolfinder}

  s.version = Schoolfinder::VERSION
  s.platform = Gem::Platform::RUBY

  s.add_dependency "activesupport", ">= 3"
  s.add_dependency "httparty", "~> 0.10.2"
  s.add_dependency "rash", "~> 0.4.0"
  s.add_development_dependency "rake", "~> 0.9.2"
  s.add_development_dependency "rspec", ">= 2.5.0"
  s.add_development_dependency "webmock", ">= 1.6.2"

  s.require_paths = ['lib']
  s.files = `git ls-files`.split("\n")
  s.test_files  = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
end
