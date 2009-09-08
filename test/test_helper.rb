require 'rubygems'
require 'RedCloth'
require 'coderay'
require 'test/unit'

path = File.join(File.dirname(__FILE__), '..', 'lib')
$LOAD_PATH << path unless $LOAD_PATH.include?(path)