FactoryGirl.define do
  factory :property, class: Property do |i|
    i.name { Faker::Commerce.product_name }
    i.description { Faker::Lorem.sentence }
  end
end
