module HexletCode::Input

  def self.build(key, value)
    label = HexletCode::Tag.build('label', for: key) { key.capitalize }
    input = HexletCode::Tag.build('input', name: key, type: 'text', value: value)
    label + input
  end
end
