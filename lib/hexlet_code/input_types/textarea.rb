class Textarea
  def self.build(key, value, option = {})
    option.delete(:as)
    label = HexletCode::Tag.build('label', for: key) { key.capitalize }
    textarea_options = { cols: 20, rows: 40, name: key }.merge option
    textarea = HexletCode::Tag.build('textarea', textarea_options) { value }
    label + textarea
  end
end
