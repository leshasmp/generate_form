# frozen_string_literal: true

require_relative 'hexlet_code/version'
require 'hexlet_code/form'

module HexletCode

  autoload(:Tag, 'hexlet_code/tag.rb')
  autoload(:Textarea, 'hexlet_code/input_types/textarea.rb')
  autoload(:Input, 'hexlet_code/input_types/input.rb')
  def self.input(key, option = {})
    value = @user.public_send(key)
    class_value = @user.public_send(:class)
    @form.tags << if option[:as] == :text
                    Textarea.build(key, value)
                  else
                    Input.build(key, value, class_value)
                  end
  end

  def self.submit(value = 'Save')
    @form.tags << Tag.build('input', name: 'commit', type: 'submit', value: value)
  end

  def self.form_for(user, options = {})
    @user = user
    @form = Form.new
    @form.url = options.key?(:url) ? options[:url] : '#'
    yield self if block_given?
    Tag.build('form', action: @form.url, method: 'post') { @form.tags.join }
  end
end
