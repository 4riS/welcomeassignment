require 'test_helper'

class PostTest < ActiveSupport::TestCase
  def setup
    @post = Post.new(title: "123456789",
                     body: "Test ody Goes Here",
                     hashtags: "#testing #rails")
  end

  test "should be valid" do
    assert @post.valid?
  end
end
