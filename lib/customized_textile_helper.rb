module CustomizedTextileHelper
  def textilize(text)
    RedCloth.new(text).to_html(:textile, :refs_syntax_highlighter)
  end
end