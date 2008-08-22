begin
  require 'redcloth'
  require 'coderay'
rescue LoadError
  puts "Requires >= RedCloth 4.0 and CodeRay."
  exit
end

require 'redcloth_with_coderay'
require 'customized_textile_helper'

RedCloth.class_eval { include RedclothWithCoderay }
ActionView::Helpers.class_eval { include CustomizedTextileHelper }