# frozen_string_literal: true

FactoryBot.define do
  factory :address do
    uri { Faker::Internet.url }
  end
end
