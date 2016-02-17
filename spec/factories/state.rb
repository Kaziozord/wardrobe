FactoryGirl.define do
  factory :state, class: State do |i|
    i.name { Faker::Commerce.product_name }
    i.description { Faker::Lorem.sentence }
  end
end
