require 'test_helper'
require 'redclothcoderay'

class PluginWithCodeTagTest < Test::Unit::TestCase
  def test_parsing_inline_code
    text = "Hello, this is *textilized*. It also has <code>@inline_code_examples</code>!"
    result = RedCloth.new(text).to_html
    
    assert_equal(%Q{<p>Hello, this is <strong>textilized</strong>. It also has <code class="inline_code"><span class="iv">@inline_code_examples</span></code>!</p>}, result)
  end
  
  def test_parsing_multiline_code
    text = %Q{Hello, this is *textilized*.
    <code>
    def hello_world
      puts "Allright"
    end
    </code>}
    result = RedCloth.new(text).to_html
    
    assert result.include?(%Q{<strong>textilized</strong>})
    assert result.include?(%Q{<pre><code class="multiline_code">})
  end
  
  def test_one_liner_multiline_code
    text = %Q{Hello, this is *textilized*.
      
    <code>
    hello_to_you
    </code>
    }
    result = RedCloth.new(text).to_html
    
    assert result.include?(%Q{<strong>textilized</strong>})
    assert result.include?(%Q{<pre><code class=\"multiline_code\">hello_to_you</code></pre>})
  end
  
  def test_parsing_other_languages
    text = %Q{Hello, this is *textilized* with some <code:html><p>HTML code</p></code>!}
    result = RedCloth.new(text).to_html

    assert result.include?(%Q{<strong>textilized</strong>})
    assert result.include?(%Q{<code class="inline_code"><span class="ta">&lt;p&gt;</span>HTML code<span class="ta">&lt;/p&gt;</span></code>})
  end
  
  def test_after_a_header
    text = %Q{h2. Hello, world.

<code>
hello_world
</code>}
    result = RedCloth.new(text).to_html
    assert result.include?(%Q{<h2>Hello, world.</h2>})
  end
  
  # This case is a real case that caused borks, which lead to 0.3.0.
  def test_odd_indents
    text = %Q{Let's try, now.

<code>
class Person < ActiveRecord::Base
  composed_of :address, :class_name => "Address", 
    :mapping => [
      [:address_street, :street],
      [:address_postal_code, :postal_code]]
end
</code>}

    result = RedCloth.new(text).to_html
    
    assert result.include?(%{[<span class="sy">:address_street</span>, <span class="sy">:street</span>],})
    assert result.include?(%{composed_of <span class="sy">:address</span>, <span class="sy">:class_name</span> =&gt; <span class="s"><span class="dl">&quot;</span><span class="k">Address</span><span class="dl">&quot;</span></span>,})
  end
end