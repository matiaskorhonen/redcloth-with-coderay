module RedclothWithCoderay
  SINGLE_LINE = '<code class="inline_code">%s</code>'
  MULTI_LINE = '<pre><code class="multiline_code">%s</code></pre>'
  WRAPPER = '<notextile>%s</notextile>'
  SOURCE_TAG_REGEXP = /([\t\n]?<source(?:\:([a-z]+))?>(.+?)<\/source>[\t\n]?)/m
  
  # The RedCloth extension that performs the syntax highlighting.
  def refs_syntax_highlighter(text)
    text.gsub!(SOURCE_TAG_REGEXP) do |m|
      all_of_it = $~[1]
      lang = ($~[2] || :ruby).to_sym
      code = $~[3].strip
      
      wrap_in = all_of_it =~ /\n/ ? MULTI_LINE : SINGLE_LINE
      highlighted = wrap_in % CodeRay.scan(code, lang).div(:wrap => nil, :css => :class)
      WRAPPER % highlighted
    end
  end
end

RedCloth.class_eval { include RedclothWithCoderay }