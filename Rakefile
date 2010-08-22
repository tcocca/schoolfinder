require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "schoolfinder"
    gem.summary = %Q{api wrapper for the education.com schoolfinder}
    gem.description = %Q{api wrapper for the education.com schoolfinder}
    gem.email = "tom.cocca@gmail.com"
    gem.homepage = "http://github.com/tcocca/schoolfinder"
    gem.authors = ["tcocca"]
    gem.add_dependency "httparty", ">= 0.6.1"
    gem.add_dependency "hashie", ">= 0.3.1"
    gem.add_development_dependency "rspec", ">= 1.2.9"
    gem.add_development_dependency "webmock", ">= 1.3.4"
    # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end

require 'spec/rake/spectask'
Spec::Rake::SpecTask.new(:spec) do |spec|
  spec.libs << 'lib' << 'spec'
  spec.spec_files = FileList['spec/**/*_spec.rb']
end

Spec::Rake::SpecTask.new(:rcov) do |spec|
  spec.libs << 'lib' << 'spec'
  spec.pattern = 'spec/**/*_spec.rb'
  spec.rcov = true
end

task :spec => :check_dependencies

task :default => :spec

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "schoolfinder #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
