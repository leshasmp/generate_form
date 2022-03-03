# frozen_string_literal: false

# generate input
class Input
  def self.build(key, value, option = {})
    label = HexletCode::Tag.build('label', for: key) { key.capitalize }
    input_options = { name: key, type: 'text', value: value }.merge option
    input = HexletCode::Tag.build('input', input_options)
    label + input
  end
end
