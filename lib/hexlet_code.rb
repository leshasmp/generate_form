# frozen_string_literal: true

require_relative 'hexlet_code/version'

module HexletCode

  autoload(:Tag, 'hexlet_code/tag.rb')
  def self.input(key, option = {})
    value = @user.public_send(key)
    if option[:as] == :text
      @tags << Tag.build('textarea', cols: 20, rows: 40, name: key) { value }
    else
      value = @user.public_send(key)
      @tags << Tag.build('input', name: key, type: 'text', value: value)
    end
  end

  def self.form_for(user, options = {})
    @user = user
    @tags = []
    yield self if block_given?
    url = options.key?(:url) ? options[:url] : '#'
    Tag.build('form', action: url, method: 'post') { @tags.join }
  end
end
