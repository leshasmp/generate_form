# frozen_string_literal: false

# Form
module HexletCode
  # generate form
  module Form
    def self.build(tags, url, submit_value)
      submit = submit_value.empty? ? '' : Tag.build('input', name: 'commit', type: 'submit', value: submit_value)
      Tag.build('form', action: url, method: 'post') { tags.map(&:render).join + submit }
    end
  end
end
