# -*- encoding: utf-8 -*- 
require 'redcloth'
raise LoadError, "need RedCloth 4.x" unless RedCloth::VERSION.to_s =~ /^4/

# Интеграция с RedCloth 4 - Textile.
class Redcloth4IntegrationTest < Test::Unit::TestCase
  C = RuTils::Gilenson::RedClothExtra
  
  def test_integration_with_redcloth_4
    
    assert_equal "<p>И вот&#160;&#171;они пошли туда&#187;, и&#160;шли шли&#160;шли</p>", 
      C.new('И вот "они пошли туда", и шли шли шли').to_html
    
    assert_equal '<p><strong>strong text</strong> and&#160;<em>emphasized text</em></p>',
      C.new("*strong text* and _emphasized text_").to_html,
        "Spaces should be preserved"
    
  end
end