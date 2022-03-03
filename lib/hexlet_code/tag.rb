module HexletCode::Tag
  def self.build(name, options = {})
    atributes = []
    tag_text = block_given? ? yield : ''
    single_tags = %w[br img input]
    unless options.empty?
      options.each do |atribute, value|
        atributes << " #{atribute}=\"#{value}\""
      end
    end
    if single_tags.include? name
      "<#{name}#{atributes.join}>"
    else
      "<#{name}#{atributes.join}>#{tag_text}</#{name}>"
    end
  end
end
