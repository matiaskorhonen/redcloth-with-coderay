Gem::Specification.new do |s|
  s.name = "redclothcoderay"
  s.version = "0.3.5"
  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.date = Time.now
  s.authors = ['August Lilleaas', 'Matias Korhonen']
  s.email = "augustlilleaas@gmail.com"
  s.files = ["lib", "lib/redclothcoderay.rb", "MIT-LICENSE", "Rakefile", "README.rdoc", "redclothcoderay.gemspec", "test", "test/coderay_options_test.rb", "test/redclothcoderay_test.rb", "test/test_helper.rb"]
  s.rubyforge_project = "redclothcoderay"
  s.has_rdoc = true
  s.add_dependency('RedCloth')
  s.add_dependency('coderay')
  s.summary = "Integrates CodeRay with RedCloth by adding a <source> tag."
  s.homepage = "http://redclothcoderay.rubyforge.org"
  s.description = %q{Adds CodeRay syntax highlighting support to RedCloth, with a ‘source’ tag.}
end
