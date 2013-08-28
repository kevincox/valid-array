# encoding: utf-8

require 'rubygems'
require 'rake'

require 'rspec/core'
require 'rspec/core/rake_task'

def rspec_settings(cfg)
	cfg.pattern = FileList['spec/**/*_spec.rb']
	cfg.rspec_opts = '--color'
end

RSpec::Core::RakeTask.new(:spec) do |spec|
	rspec_settings spec
end

RSpec::Core::RakeTask.new(:rcov) do |spec|
	rspec_settings spec
	spec.rcov = true
end

task :default => :test
task :test => :spec

require 'rdoc/task'
Rake::RDocTask.new do |rdoc|
	version = File.read('VERSION').chomp

	rdoc.rdoc_dir = 'rdoc'
	rdoc.title = "valid-array #{version}"
	rdoc.rdoc_files.include('README*')
	rdoc.rdoc_files.include('lib/**/*.rb')
end
