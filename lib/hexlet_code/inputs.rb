# frozen_string_literal: false

module HexletCode::Inputs
  # inputs
  class TextInput
    def initialize(key, value, option)
      @key = key
      @value = value
      @option = option
    end

    def render
      @option.delete(:as)
      label = HexletCode::Tag.build('label', for: @key) { @key.capitalize }
      textarea_options = { cols: 20, rows: 40, name: @key }.merge @option
      textarea = HexletCode::Tag.build('textarea', textarea_options) { @value }
      label + textarea
    end
  end

  class BaseInput
    # inputs
    def initialize(key, value, option)
      @key = key
      @value = value
      @option = option
    end

    def render
      label = HexletCode::Tag.build('label', for: @key) { @key.capitalize }
      input_options = { name: @key, type: 'text', value: @value }.merge @option
      input = HexletCode::Tag.build('input', input_options)
      label + input
    end
  end
end
