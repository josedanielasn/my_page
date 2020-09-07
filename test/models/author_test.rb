require 'test_helper'

class AuthorTest < ActiveSupport::TestCase
 
  test 'author_name should not be empty' do 
    current_author = Author.new(author_name:'')
    assert_not current_author.save, 'Saved an empty author_name'
  end

  test 'author_name should unique' do 
    current_author = Author.new(author_name:'jose')
    another_author = current_author.dup
    current_author.save
    assert_not another_author.save ,'Saved an author_name that is not unique'
  end

  test 'It should save a non-empty and unique author_name' do 
    current_author = Author.new(author_name:'jose')
    another_author = Author.new(author_name:'daniel')
    current_author.save
    assert another_author.save, 'Saved an author_name that is not unique'
  end
end
