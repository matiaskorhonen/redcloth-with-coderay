Gem::Specification.new do |s|
  s.name = "redclothcoderay"
  s.version = "0.3.0"
  s.date = "2009-05-06"
  s.authors = ["August Lilleaas"]
  s.email = "augustlilleaas@gmail.com"
  s.rubyforge_project = "redclothcoderay"
  s.has_rdoc = true
  s.add_dependency('RedCloth')
  s.add_dependency('coderay')
  s.summary = "Integrates CodeRay with RedCloth by adding a <source> tag."
  s.homepage = "http://redclothcoderay.rubyforge.org"
  s.extensions = ["Rakefile"]
  s.files = Dir["**/*"].select {|d| File.file?(d) }
end