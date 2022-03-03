# frozen_string_literal: false

# Form
class Form
  attr_accessor :tags, :url

  def initialize
    @tags = []
    @url = ''
  end
end
