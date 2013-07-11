require 'test_helper'

class Api::V1::MembershipsControllerTest < ActionController::TestCase
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

  test "#create without access token" do
    post 'create_organization', {}
    assert response.status == 401
  end

  test "#create with invalid access token" do
    post 'create_organization', {}, { 'Authorization' => "Bearer 12345" }
    assert response.status == 401
  end

  test "#create without an organization name" do
    joe = users(:joe)
    api_key = joe.session_api_key
    post 'create_organization', {}, { 'Authorization' => "Bearer #{api_key.access_token}" }
    json = JSON.parse(response.body)
    assert json['errors']['name'].include? "can't be blank"
  end

  test "#create with valid data" do
    joe = users(:joe)
    api_key = joe.session_api_key
    post 'create_organization', { name: 'My Organization' }, { 'Authorization' => "Bearer #{api_key.access_token}" }
    json = JSON.parse(response.body)
    assert json['membership']['is_admin']
    assert json['membership']['organization_id'] > 0
  end
end
