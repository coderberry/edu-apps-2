require 'bcrypt'

FactoryGirl.define do
  factory :user do
    name "Joe User"
    sequence(:email) {|n| "#{name.parameterize}{n}@example.com".downcase }
    password "secret"
    password_confirmation { password }
  end
end
