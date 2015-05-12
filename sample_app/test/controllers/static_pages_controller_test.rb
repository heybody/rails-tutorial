require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
    assert_select "title",title("主页")
  end

  test "should get help" do
    get :help
    assert_response :success
    assert_select "title",title("帮助")
  end
  
  
  test "should get about" do
    get :about
    assert_response :success
    assert_select "title",title("关于")
  end
  private 
    def title(title)
      title + " | SAMPLE APP"
    end
end
