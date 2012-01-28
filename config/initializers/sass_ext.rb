module Sass::Script::Functions
  def remove_dashes(string)
    assert_type string, :String
    Sass::Script::String.new(string.value.gsub '-', '')
  end
  declare :remove_dashes, :args => [:string]
end

