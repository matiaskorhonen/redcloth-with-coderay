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