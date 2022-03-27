# frozen_string_literal: true

require_relative 'hexlet_code/version'
require 'hexlet_code/form'
require 'active_support'

# module hexletcode
module HexletCode
  autoload(:Tag, 'hexlet_code/tag.rb')
  autoload(:Textarea, 'hexlet_code/input_types/textarea.rb')
  autoload(:Input, 'hexlet_code/input_types/input.rb')
  def self.input(key, option = {})
    value = @user.public_send(key)
    input = {}
    input[:type] = option[:as].nil? ? 'base' : option[:as]
    klass_name = "HexletCode::Inputs::#{input[:type].capitalize}Input"
    klass = klass_name.constantize
    input = klass.new(key, value, option)
    @form.tags << input.render
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
