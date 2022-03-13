# frozen_string_literal: true

require 'test_helper'

class HexletCodeTest < Minitest::Test
  User = Struct.new(:name, :job, :gender, keyword_init: true)
  def setup
    @user = User.new name: 'rob', job: 'hexlet', gender: 'm'
    @form = File.read('test/fixtures/form.html')
    @form_with_action = File.read('test/fixtures/form_with_action.html')
    @form_with_fields = File.read('test/fixtures/form_with_fields.html')
    @form_with_submit = File.read('test/fixtures/form_with_submit.html')
  end

  def test_form_for
    form = HexletCode.form_for @user
    assert_equal @form, form
  end

  def test_form_action
    form_with_action = HexletCode.form_for @user, url: '/users'
    assert_equal @form_with_action, form_with_action
  end

  def test_form_fields
    form_with_fields = HexletCode.form_for @user do |f|
      f.input :name, class: 'user-input'
      f.input :job, as: :text, rows: 50, cols: 50
    end
    assert_equal @form_with_fields, form_with_fields
  end

  def test_form_submit
    form_with_submit = HexletCode.form_for @user do |f|
      f.input :name, class: 'user-input'
      f.input :job
      f.submit
    end
    assert_equal @form_with_submit, form_with_submit
  end
end
