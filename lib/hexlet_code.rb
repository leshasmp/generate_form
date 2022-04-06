# frozen_string_literal: true

require_relative 'hexlet_code/version'
require 'active_support'
require 'active_support/core_ext'

# module hexletcode
module HexletCode
  autoload(:Tag, 'hexlet_code/tag.rb')
  autoload(:Inputs, 'hexlet_code/inputs.rb')
  autoload(:Form, 'hexlet_code/form.rb')
  def self.input(key, option = {})
    value = @user.public_send(key)
    input = {}
    input[:type] = option[:as].nil? ? 'base' : option[:as]
    klass_name = "HexletCode::Inputs::#{input[:type].capitalize}Input"
    klass = klass_name.constantize
    input = klass.new(key, value, option)
    @tags << input
  end

  def self.submit(value = 'Save')
    @submit_value = value
  end

  def self.form_for(user, options = {})
    @user = user
    @tags = []
    @url = options.key?(:url) ? options[:url] : '#'
    @submit_value = ''
    yield self if block_given?
    HexletCode::Form.build @tags, @url, @submit_value
  end
end
