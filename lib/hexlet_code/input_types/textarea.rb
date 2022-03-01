module HexletCode::Textarea

  def self.build(key, value)
    HexletCode::Tag.build('textarea', cols: 20, rows: 40, name: key) { value }
  end
end
