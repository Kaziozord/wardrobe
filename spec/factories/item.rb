FactoryGirl.define do
  factory :item, class: Item do |i|
    i.name { Faker::Commerce.product_name }
    i.description { Faker::Lorem.sentence }
  end
end
