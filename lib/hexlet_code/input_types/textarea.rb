module HexletCode::Textarea

  def self.build(key, value)
    label = HexletCode::Tag.build('label', for: key) { key.capitalize }
    textarea = HexletCode::Tag.build('textarea', cols: 20, rows: 40, name: key) { value }
    label + textarea
  end
end
