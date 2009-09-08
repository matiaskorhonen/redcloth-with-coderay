Gem::Specification.new do |s|
  s.name = "redclothcoderay"
  s.version = "0.3.4"
  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.date = Time.now
  s.authors = ['August Lilleaas', 'Matias Korhonen']
  s.email = "augustlilleaas@gmail.com"
  s.files = Dir["**/*"].select {|d| File.file?(d) }
  s.rubyforge_project = "redclothcoderay"
  s.has_rdoc = true
  s.add_dependency('RedCloth')
  s.add_dependency('coderay')
  s.summary = "Integrates CodeRay with RedCloth by adding a <source> tag."
  s.homepage = "http://redclothcoderay.rubyforge.org"
  s.files = Dir["**/*"].select {|d| File.file?(d) }
  s.description = <<-EOF
    Adds CodeRay syntax highlighting support to RedCloth, with a ‘source’ tag. See the examples below.
    
    A short summary of what you can do:
    
      * <source>foo</source> - Use this tag to produce CodeRay highlighted HTML for the contents within that tag. The language defaults to Ruby.
      * <source:css>foo</source> - Highlight as usual, but highlight as CSS. Supports everything CodeRay supports. Refer to the CodeRay documentation for a list of supported languages.
  EOF
end
