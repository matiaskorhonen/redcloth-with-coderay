require 'rubygems'
require 'redcloth'
require 'coderay'
require 'test/unit'

require 'action_controller'
require 'action_controller/test_process'

current_directory = File.dirname(__FILE__)
$:.unshift File.join(current_directory, '..', 'lib')
require File.join(current_directory, '..', 'init')

class PluginTest < Test::Unit::TestCase
  def test_parsing_inline_code
    text = "Hello, this is *textilized*. It also has <source>@inline_code_examples</source>!"
    result = RedCloth.new(text).to_html(:textile, :refs_syntax_highlighter)
    
    assert_equal(%Q{<p>Hello, this is <strong>textilized</strong>. It also has <code class="inline_code"><span class="iv">@inline_code_examples</span></code>!</p>}, result)
  end
  
  def test_parsing_multiline_code
    text = %Q{Hello, this is *textilized*.
    <source>
    def hello_world
      puts "Allright"
    end
    </source>}
    result = RedCloth.new(text).to_html(:textile, :refs_syntax_highlighter)
    
    assert result.include?(%Q{<strong>textilized</strong>})
    assert result.include?(%Q{<pre><code class="multiline_code">})
  end
  
  def test_one_liner_multiline_code
    text = %Q{Hello, this is *textilized*.
      
    <source>
    hello_to_you
    </source>
    }
    result = RedCloth.new(text).to_html(:textile, :refs_syntax_highlighter)
    
    assert result.include?(%Q{<strong>textilized</strong>})
    assert result.include?(%Q{<pre><code class=\"multiline_code\">hello_to_you</code></pre>})
  end
  
  def test_parsing_other_languages
    text = %Q{Hello, this is *textilized* with some <source:html><p>HTML code</p></source>!}
    result = RedCloth.new(text).to_html(:textile, :refs_syntax_highlighter)
    
    assert result.include?(%Q{<strong>textilized</strong>})
    assert result.include?(%Q{<code class="inline_code"><span class="ta">&lt;p&gt;</span>HTML code<span class="ta">&lt;/p&gt;</span></code>})
  end
end