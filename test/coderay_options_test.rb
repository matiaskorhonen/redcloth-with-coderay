require 'test_helper'
require 'RedCloth'
require 'redclothcoderay'

class CoderayOptionsTest < Test::Unit::TestCase
  def test_it
    RedclothCoderay.coderay_options :line_numbers => :table
    assert_equal :table, RedclothCoderay::CODERAY_OPTIONS[:line_numbers]
    assert RedCloth.new("<source>ugly_inline :stuff</source>").to_html(:refs_syntax_highlighter).include?(%{<table class="CodeRay"})
  end
end