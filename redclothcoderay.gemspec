Gem::Specification.new do |s|
  s.name = "redclothcoderay"
  s.version = "0.2.0"
  s.date = "2009-04-23"
  s.authors = ["August Lilleaas"]
  s.email = "augustlilleaas@gmail.com"
  s.rubyforge_project = "redclothcoderay"
  s.has_rdoc = true
  s.add_dependency('RedCloth')
  s.add_dependency('coderay')
  s.description = "Integrates CodeRay with RedCloth by adding a <source> tag."
  s.homepage = "http://redclothcoderay.rubyforge.org"
  s.extensions = ["Rakefile"]
  s.files =
    ["redclothcoderay.gemspec",
    "README",
    "Rakefile",
    "lib/redcloth_with_coderay.rb",
    "tests/redclothcoderay_test.rb"]
end