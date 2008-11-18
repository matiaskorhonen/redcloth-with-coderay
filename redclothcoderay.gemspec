# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{redclothcoderay}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["August Lilleaas"]
  s.date = %q{2008-11-18}
  s.description = %q{Integrates CodeRay with RedCloth by adding a <source> tag.}
  s.email = %q{augustlilleaas@gmail.com}
  s.extra_rdoc_files = ["lib/redcloth_with_coderay/customized_textile_helper.rb", "lib/redcloth_with_coderay/redcloth_extension.rb", "lib/redcloth_with_coderay.rb", "README"]
  s.files = ["lib/redcloth_with_coderay/customized_textile_helper.rb", "lib/redcloth_with_coderay/redcloth_extension.rb", "lib/redcloth_with_coderay.rb", "Manifest", "MIT-LICENSE", "Rakefile", "README", "test/redclothcoderay_test.rb", "redclothcoderay.gemspec"]
  s.has_rdoc = true
  s.homepage = %q{http://redclothcoderay.rubyforge.org/}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Redclothcoderay", "--main", "README"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{redclothcoderay}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Integrates CodeRay with RedCloth by adding a <source> tag.}
  s.test_files = ["test/redclothcoderay_test.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<RedCloth>, [">= 0"])
      s.add_runtime_dependency(%q<coderay>, [">= 0"])
      s.add_development_dependency(%q<echoe>, [">= 0"])
    else
      s.add_dependency(%q<RedCloth>, [">= 0"])
      s.add_dependency(%q<coderay>, [">= 0"])
      s.add_dependency(%q<echoe>, [">= 0"])
    end
  else
    s.add_dependency(%q<RedCloth>, [">= 0"])
    s.add_dependency(%q<coderay>, [">= 0"])
    s.add_dependency(%q<echoe>, [">= 0"])
  end
end
