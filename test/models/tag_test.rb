require 'test_helper'

class TagTest < ActiveSupport::TestCase
  test "Should not save empty tag_name" do
    new_tag = Tag.new(tag_name:'')
    assert_not new_tag.save, 'Saved with an empty tag'
  end

  test "Should not save tag_name with length < 2" do
    new_tag = Tag.new(tag_name:'1')
    assert_not new_tag.save, 'Saved with an tag with length < 2'
  end

  test "Should not save non-unique tag_name" do
    new_tag = Tag.create(tag_name:'duplicate sample')
    dup_tag = new_tag.dup
    assert_equal(new_tag.tag_name, dup_tag.tag_name, ["Saved duplicate tag_name"])
  end

end
