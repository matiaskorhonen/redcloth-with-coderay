require 'rake'
require 'rake/testtask'

task :default => :test

task :test do
  $LOAD_PATH << File.join(File.dirname(__FILE__), 'test')
  load "test/redclothcoderay_test.rb"
end