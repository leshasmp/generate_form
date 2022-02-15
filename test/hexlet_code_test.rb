# frozen_string_literal: true

require "test_helper"

class HexletCodeTest < Minitest::Test
  def setup
    @br = '<br>'
    @img = '<img src="path/to/image">'
    @input = '<input type="submit" value="Save">'
    @email = '<label>Email</label>'
    @label = '<label for="email">Email</label>'
    @div = '<div></div>'
  end

  def test_tag_creation
    assert_equal @br, HexletCode::Tag.build('br')
    assert_equal @img, HexletCode::Tag.build('img', src: 'path/to/image')
    assert_equal @input, HexletCode::Tag.build('input', type: 'submit', value: 'Save')
    assert_equal @email, HexletCode::Tag.build('label') { 'Email' }
    assert_equal @label, HexletCode::Tag.build('label', for: 'email') { 'Email' }
    assert_equal @div, HexletCode::Tag.build('div')
  end
end
