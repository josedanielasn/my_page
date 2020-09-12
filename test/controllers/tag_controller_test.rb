require 'test_helper'

class TagControllerTest < ActionDispatch::IntegrationTest

  setup do
    @user = User.create(username:'jose',email:'jose@yahoo.com',password:'josejose', admin:true)
    login_user(@user)
    @author = Author.create(author_name:'Dan Angelo')
    @quote = Quote.create(quote:'my new quote',author_id:@author.id)
    @tag = Tag.create(tag_name:'added_tag')
  end
  test "should get new" do
    get new_tag_url
    assert_response :success
  end

  test "should get create" do
    post create_tag_url, params:{tag:{tag_name: 'new_tag'}}
    assert_response :redirect
  end
   
  test "should get edit" do
    get edit_tag_url(@tag)
    assert_response :success
  end
  test "should update tag" do
    patch update_tag_path(@tag), params:{tag: {tag_name:'updated'}}
    assert_response :redirect
  end

  test "should get index" do
    get tags_url
    assert_response :success
  end
 
  test 'Should delete tag' do
    tag = Tag.find_by(tag_name:@tag.tag_name)
    assert_difference "Tag.count", -1 do
      delete delete_tag_path(tag)
    end
  end
end
