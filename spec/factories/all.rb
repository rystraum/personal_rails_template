# Read about factories at https://github.com/thoughtbot/factory_girl

require 'ffaker'
FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "#{n}#{Faker::Internet.email}" }
    username Faker::Lorem.words(1).first
    password "password"
    password_confirmation "password"
  end
end
