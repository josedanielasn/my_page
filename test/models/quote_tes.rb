require 'test_helper'

class QuoteTest < ActiveSupport::TestCase

  # setup do
    # Author.create(author_name:'Jose Daniel')
    # @current_author = Author.first
  # end
 
  test 'quote should not be empty' do 
    current_quote = Quote.new(quote:'')
    assert_not current_quote.save, 'Saved an empty author_name'
  end

  test 'quote should unique' do 
    current_quote = Quote.new(quote:'jose'*10)
    another_quote = current_quote.dup
    current_quote.save
    assert_not another_quote.save ,'Saved an author_name that is not unique'
  end

  test 'It should save a non-empty and unique quote' do 
    current_quote = Quote.new(quote:'jose'*10)
    another_quote = Quote.new(quote:'daniel'*10)
    current_quote.save
    p current_quote.author
    assert another_quote.save, 'Saved an author_name that is not unique'
  end

  # test 'test for association of quote to author' do
  #   Author.create(author_name:'Jose Daniel')
  #   current_author = Author.first
  #   current_quote = current_author.Quote.create(quote:'jose'*10)
  #   assert current_author.id == current_quote.id, 'The quote and author does not have any association'
  # end
end
