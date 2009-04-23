require 'test_helper'
gem 'RedCloth', "< 4.0.0"
require 'RedCloth'
require 'redclothcoderay'

# Is in isolation, because it meddles with states and shit. CBA to mock that.
class AlwaysOn3Test < Test::Unit::TestCase
  def test_always_on
    RedclothCoderay.always_on
    result = RedCloth.new(%{I thar. <source>inline_code</source> and *textile*!}).to_html
    assert result.include?("<strong>textile</strong>")
    assert result.include?('<code class="inline_code">')
  end
end