# frozen_string_literal: true

require "test_helper"

class HexletCodeTest < Minitest::Test
  User = Struct.new(:name, :job, :gender, :class, keyword_init: true)
  def setup
    @br = '<br>'
    @img = '<img src="path/to/image">'
    @input = '<input type="submit" value="Save">'
    @email = '<label>Email</label>'
    @label = '<label for="email">Email</label>'
    @div = '<div></div>'
    @user = User.new name: 'rob', job: 'hexlet', gender: 'm'
    @form = File.read('./fixtures/form.html')
    @form_with_action = File.read('./fixtures/form_with_action.html')
    @form_with_fields = File.read('./fixtures/form_with_fields.html')
    @form_with_submit = File.read('./fixtures/form_with_submit.html')
  end

  def test_tag_build
    assert_equal @br, HexletCode::Tag.build('br')
    assert_equal @img, HexletCode::Tag.build('img', src: 'path/to/image')
    assert_equal @input, HexletCode::Tag.build('input', type: 'submit', value: 'Save')
    assert_equal @email, HexletCode::Tag.build('label') { 'Email' }
    assert_equal @label, HexletCode::Tag.build('label', for: 'email') { 'Email' }
    assert_equal @div, HexletCode::Tag.build('div')
  end

  def test_form_for
    form = HexletCode.form_for @user do |f|
    end
    form_with_action = HexletCode.form_for @user, url: '/users' do |f|
    end
    form_with_fields = HexletCode.form_for @user do |f|
      f.input :name, class: 'user-input'
      f.input :job, as: :text, rows: 50, cols: 50
    end
    form_with_submit = HexletCode.form_for @user do |f|
      f.input :name, class: 'user-input'
      f.input :job
      f.submit
    end
    assert_equal @form, form
    assert_equal @form_with_action, form_with_action
    assert_equal @form_with_fields, form_with_fields
    assert_equal @form_with_submit, form_with_submit
  end
end
