module RedclothCoderay
  SINGLE_LINE = '<code class="inline_code">%s</code>'
  MULTI_LINE = '<pre><code class="multiline_code">%s</code></pre>'
  SOURCE_TAG_REGEXP = /(([\t\n])?<source(?:\:([a-z]+))?>(.+?)<\/source>[\t\n]?)/m
  CODERAY_OPTIONS = {:wrap => nil, :css => :class}
  
  # The RedCloth extension that performs the syntax highlighting.
  def refs_syntax_highlighter(text)
    text.gsub!(SOURCE_TAG_REGEXP) do |m|
      all_of_it = $~[1]
      whitespace_before = $~[2]
      lang = ($~[3] || :ruby).to_sym
      code = $~[4].strip
      
      wrap_in = all_of_it =~ /\n/ ? MULTI_LINE : SINGLE_LINE
      highlighted = wrap_in % CodeRay.scan(code, lang).div(CODERAY_OPTIONS)
      
      "#{whitespace_before}<notextile>#{highlighted}</notextile>"
    end
  end
  
  # Adds the syntax highlighter to all RedCloth#to_htmls, so that you don't have to
  # do that to_html(:textile, :refs_syntax_highlighter) thin.
  def self.always_on
    if RedCloth::VERSION.to_s < "4"
      RedCloth::DEFAULT_RULES << :refs_syntax_highlighter
    else
      RedCloth::TextileDoc.class_eval {
        alias :_to_html :to_html
        
        def to_html(*rules)
          rules << :refs_syntax_highlighter
          _to_html(*rules)
        end
      }
    end
  end
  
  def self.coderay_options(options)
    CODERAY_OPTIONS.replace(options)
  end
end

RedCloth.class_eval { include RedclothCoderay }