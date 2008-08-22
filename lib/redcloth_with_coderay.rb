module RedclothWithCoderay
  SINGLE_LINE = '<code class="inline_code">%s</code>'
  MULTI_LINE = '<pre><code class="multiline_code">%s</code></pre>'
  
  def refs_syntax_highlighter(text)
    text.gsub!(/(<source(?:\:([a-z]+))?>(.+?)<\/source>)/m) do |m|
      all, lang, code = $~[1..3]
      lang ||= :ruby
      
      wrap_in = code.scan(/\n/).empty? ? 
        '<code class="inline_code">%s</code>' : 
        '<pre><code class="multiline_code">%s</code></pre>'
      highlighted = wrap_in % CodeRay.scan(code.strip, lang.to_sym).div(:wrap => nil, :css => :class)

      "<notextile>#{highlighted}</notextile>"
    end
  end
end