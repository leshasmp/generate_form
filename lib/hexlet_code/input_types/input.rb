module HexletCode::Input

  def self.build(key, value, class_value = nil)
    label = HexletCode::Tag.build('label', for: key) { key.capitalize }
    input_options = { name: key, type: 'text', value: value }
    input_options[:class] = class_value unless class_value.nil?
    input = HexletCode::Tag.build('input', input_options)
    label + input
  end
end
