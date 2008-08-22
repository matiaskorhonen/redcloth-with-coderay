class String
  def has_newlines?
    self =~ /\n/
  end
end

module RedclothWithCoderay
  SINGLE_LINE = '<code class="inline_code">%s</code>'
  MULTI_LINE = '<pre><code class="multiline_code">%s</code></pre>'
  WRAPPER = '<notextile>%s</notextile>'
  SOURCE_TAG_REGEXP = /(<source(?:\:([a-z]+))?>(.+?)<\/source>)/m
  
  def refs_syntax_highlighter(text)
    text.gsub!(SOURCE_TAG_REGEXP) do |m|
      lang = ($~[2] || :ruby).to_sym
      code = $~[3].strip
      
      wrap_in = code.has_newlines? ? MULTI_LINE : SINGLE_LINE
      highlighted = wrap_in % CodeRay.scan(code, lang).div(:wrap => nil, :css => :class)
      WRAPPER % highlighted
    end
  end
end