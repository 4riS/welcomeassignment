require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(uid: "123456789",
                     name: "John Doe",
                     photo_url: "photo/goes/here")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "uid should be present" do
    @user.uid = "123456789"
    assert @user.valid?
  end

end
