require 'test_helper'
require 'RedCloth'
require 'redclothcoderay'

class CoderayOptionsTest < Test::Unit::TestCase
  def test_it
    RedclothCoderay.coderay_options :line_numbers => :table
    assert_equal :table, RedclothCoderay::CODERAY_OPTIONS[:line_numbers]
    assert RedCloth.new("<source>ugly_inline :stuff</source>").to_html(:refs_syntax_highlighter).include?(%{<table class="CodeRay"})
  end

  def test_it_with_code_tag
    RedclothCoderay.coderay_options :line_numbers => :table
    assert_equal :table, RedclothCoderay::CODERAY_OPTIONS[:line_numbers]
    assert RedCloth.new("<code>ugly_inline :stuff</code>").to_html(:refs_syntax_highlighter).include?(%{<table class="CodeRay"})
  end

end