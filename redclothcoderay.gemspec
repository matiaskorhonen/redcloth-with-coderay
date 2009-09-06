# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "redclothcoderay"
  s.version = "0.3.1"
  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.date = "2009-05-06"
  s.description = %q{Adds CodeRay syntax highlighting to RedCloth, by using a <source> tag.}
  s.authors = ["August Lilleaas"]
  s.email = "augustlilleaas@gmail.com"
  s.files = ["lib", "lib/redclothcoderay.rb", "MIT-LICENSE", "Rakefile", "README.rdoc", "redclothcoderay.gemspec", "test", "test/coderay_options_test.rb", "test/redclothcoderay_test.rb", "test/test_helper.rb"]
  s.rubyforge_project = "redclothcoderay"
  s.has_rdoc = true
  s.add_dependency('RedCloth')
  s.add_dependency('coderay')
  s.summary = "Integrates CodeRay with RedCloth by adding a <source> tag."
  s.homepage = "http://redclothcoderay.rubyforge.org"
  s.extensions = ["Rakefile"]
  s.files = Dir["**/*"].select {|d| File.file?(d) }
end