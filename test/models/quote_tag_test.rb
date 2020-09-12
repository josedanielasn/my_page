require 'test_helper'

class QuoteTagTest < ActiveSupport::TestCase

  setup do
    @author = Author.create(author_name:'Dan Angelo')
    @quote = Quote.create(quote:'my new quote',author_id:@author.id)
    @tag = Tag.create(tag_name:'added_tag')
  end

  test "should not save an empty quote_id" do
    new_quote_id = QuoteTag.new(quote_id: nil, tag_id:1)
    assert_not new_quote_id.save, 'Saved an empty quote_id'
  end

  test "should not save an empty tag_id" do
    new_quote_id = QuoteTag.new(quote_id: 1, tag_id:nil)
    assert_not  new_quote_id.save, 'Saved an empty quote_id'
  end

  test "should not save an empty tag_id and quote_id" do
    new_quote_id = QuoteTag.new(quote_id: nil, tag_id:nil)
    assert_not  new_quote_id.save, 'Saved an empty quote_id and tag_id'
  end  

  test "should save non-empty quote_id and tag_id" do
    new_quote_id = QuoteTag.new(quote_id: @quote.id, tag_id:@tag.id)
    assert new_quote_id.save, 'Saved a non-empt quote_id and tag_id'
  end
end

