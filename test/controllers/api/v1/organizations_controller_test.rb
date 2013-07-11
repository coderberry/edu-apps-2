require 'test_helper'

class Api::V1::OrganizationsControllerTest < ActionController::TestCase
  test "#index without access token" do
    get 'index'
    assert response.status == 401
  end

  test "#index with invalid access token" do
    get 'index', {}, { 'Authorization' => "Bearer 12345" }
    assert response.status == 401
  end

  test "with valid access token" do
    joe = users(:joe)
    api_key = joe.session_api_key
    get 'index', {}, { 'Authorization' => "Bearer #{api_key.access_token}" }
    json = JSON.parse(response.body)
    assert json['memberships'].size == 2
  end
end
