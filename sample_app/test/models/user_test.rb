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
  
  test "email should be valid" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  
  end
end