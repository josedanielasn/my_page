require 'test_helper'

class TagTest < ActiveSupport::TestCase
  test "Should not save empty tag_name" do
    new_tag = Tag.new(tag_name:'educational')
    assert_not new_tag.save, 'Saved with an empty tag'
  end
end
