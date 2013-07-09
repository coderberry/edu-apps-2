require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "generates access token" do
    joe = users(:joe)
    api_key = joe.session_api_key
    assert !api_key.new_record?
    assert api_key.access_token =~ /\S{32}/
  end
end
