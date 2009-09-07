module RedclothCoderay
  SINGLE_LINE = '<code class="inline_code">%s</code>'
  MULTI_LINE = '<div class="multiline_code">%s</div>'
  SOURCE_TAG_REGEXP = /(([\t\n])?<source(?:\:([a-z]+))?>(.+?)<\/source>([\t\n])?)/m
  CODERAY_OPTIONS = {:wrap => nil, :css => :class}
  
  def preprocess_with_syntax_highlighting(text)
    text.gsub(SOURCE_TAG_REGEXP) do |m|
      all_of_it = $~[1]
      whitespace_before = $~[2]
      lang = ($~[3] || :ruby).to_sym
      code = $~[4].strip
      whitespace_after = $~[5]
      
      wrap_in = all_of_it =~ /\n/ ? MULTI_LINE : SINGLE_LINE
      highlighted = wrap_in % CodeRay.scan(code, lang).div(CODERAY_OPTIONS)
      
      "#{whitespace_before}<notextile>#{highlighted}</notextile>#{whitespace_after}"
    end
  end
  
  def self.coderay_options(options)
    CODERAY_OPTIONS.replace(options)
  end
end

redcloth_thingie = RedCloth::VERSION.to_s < "4" ? RedCloth : RedCloth::TextileDoc

redcloth_thingie.class_eval {
  alias_method :_initialize, :initialize
  
  def initialize(text, *args)
    text = preprocess_with_syntax_highlighting(text)
    _initialize(text, *args)
  end
}

redcloth_thingie.send(:include, RedclothCoderay)
