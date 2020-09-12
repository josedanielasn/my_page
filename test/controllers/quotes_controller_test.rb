require 'test_helper'

class QuotesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = User.create(username:'jose',email:'jose@yahoo.com',password:'josejose', admin:true)
    # byebug
    login_user(@user)
    @author = Author.create(author_name:'Dan Angelo')
    @quote = Quote.create(quote:'this my new quote',author_id:@author.id)
    @get_quote = Quote.find(@quote.id)
  end
  # test "should get index" do
  #   get quotes_index_url
  #   assert_response :success
  # end

  test "1. should get show" do
    # byebug
    assert_generates "/authors/#{@author.id}/quotes/#{@quote.id}", { controller: "quotes", action: "show", author_id: @author.id, id: @quote.id }
    assert_response :redirect                   
  end

  test "2. should get new" do
    get new_author_quotes_url(@get_quote.author_id)
    assert_response :success
  end

  test "3. should get create" do
    post "/authors/#{@author.id}/quotes", params:{quote:{quote:'This is a new quote', author_id: @get_quote.author_id}}
    assert_response :redirect
  end

  test "4. should get edit" do
    # byebug
    # quote = Quote.find(@quote.id)
    assert_generates "/authors/#{@get_quote.author_id}/quotes/#{@get_quote.id}/edit", { controller: "quotes", action: "edit", author_id: @get_quote.author_id, id: @get_quote.id }
    assert_response :redirect
  end

  test "5. should get update" do
    # quote = Quote.find_by(quote:'my new quote')
    patch "/authors/#{@get_quote.author_id}/quotes/#{@get_quote.id}",params:{quote:{quote:"This quote is updated"}}
    
  end

  # test "6. should get destroy" do
  #   assert_difference "Quote.count", -1 do
  #     byebug
  #     delete  delete_author_quotes_path(@get_quote.author_id,@get_quote.id)
  #   end
  # end

end
