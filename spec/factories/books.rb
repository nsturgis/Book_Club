FactoryGirl.define do
  factory :book do
    sequence(:title) { |n| "Great Book #{n}"}
    author "Nicholas Sturgis"
    year_published "1992"
    description "This will change your life."
    category "amazing"
  end

  factory :review do
    book
    rating 5
    body "This actually changed my life"

  end
end
