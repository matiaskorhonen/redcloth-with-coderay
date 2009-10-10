require 'rake'
require 'rake/testtask'
$LOAD_PATH << File.join(File.dirname(__FILE__), 'test')

task :default => "test:v4"

namespace :test do
  desc "Test RedCloth 3"
  task :v3 do
    gem 'RedCloth', "< 4.0.0"
    require 'RedCloth'
    
    load "test/redclothcoderay_test.rb"
  end
  
  desc "Test RedCloth 4"
  task :v4 do
    gem 'RedCloth', ">= 4.0.0"
    require 'RedCloth'
    
    load "test/redclothcoderay_test.rb"
  end
end

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gemspec|
    gemspec.name = "redclothcoderay"
    gemspec.summary = "Integrates CodeRay with RedCloth by adding a <source> tag."
    gemspec.description = %q{Adds CodeRay syntax highlighting support to RedCloth, with a ‘source’ tag.}
    gemspec.email = ["augustlilleaas@gmail.com", "korhonen.matt@gmail.com"]
    gemspec.homepage = "http://redclothcoderay.rubyforge.org"
    gemspec.authors = ['August Lilleaas', 'Matias Korhonen']
    gemspec.add_dependency('RedCloth')
    gemspec.add_dependency('coderay')
    gemspec.has_rdoc = true
    gemspec.rubyforge_project = "redclothcoderay"
    gemspec.files = FileList["lib", "lib/redclothcoderay.rb", "MIT-LICENSE", "Rakefile", "README.rdoc", "redclothcoderay.gemspec", "test", "test/coderay_options_test.rb", "test/redclothcoderay_test.rb", "test/test_helper.rb"]
  end
rescue LoadError
  puts "Jeweler not available. Install it with: sudo gem install jeweler"
end

