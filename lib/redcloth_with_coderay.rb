$: << File.join(File.dirname(__FILE__), 'redcloth_with_coderay')

require 'redcloth_extension'
require 'customized_textile_helper'

RedCloth.class_eval { include RedclothWithCoderay }
ActionView::Helpers.class_eval { include CustomizedTextileHelper }