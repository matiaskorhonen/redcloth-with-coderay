require 'rake'

Gem::Specification.new do |s|
  s.name = "redclothcoderay"
  s.version = "0.3.5"
  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.date = Time.now
  s.authors = ['August Lilleaas', 'Matias Korhonen']
  s.email = "augustlilleaas@gmail.com"
  s.files = FileList['lib/**/*.rb', 'bin/*', '[A-Z]*', 'test/**/*'].to_a
  s.rubyforge_project = "redclothcoderay"
  s.has_rdoc = true
  s.add_dependency('RedCloth')
  s.add_dependency('coderay')
  s.summary = "Integrates CodeRay with RedCloth by adding a <source> tag."
  s.homepage = "http://redclothcoderay.rubyforge.org"
  s.files = Dir["**/*"].select {|d| File.file?(d) }
  s.description = %q{Adds CodeRay syntax highlighting support to RedCloth, with a ‘source’ tag.}
end
