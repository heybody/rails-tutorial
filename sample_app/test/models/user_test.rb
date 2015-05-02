require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  def setup
    @user = User.new(name: "Example User", email: "user@example.com")
  end
  
  test "should be valid" do
    assert @user.valid?
  end
  
  test "should not be valid" do
    @user.email = "  "
    @user.name = "  "
    assert_not  @user.valid?
  end
  
  test "name not be too long" do
    @user.name = "a"*51
    assert_not  @user.valid?
  end
  test "email not be too long" do
    @user.email = "a"*257
    assert_not  @user.valid?
  end
end
