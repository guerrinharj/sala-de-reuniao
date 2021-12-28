require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "name" do
    user = User.new(name: "john")
    assert_equal "john", user.name
  end
end
