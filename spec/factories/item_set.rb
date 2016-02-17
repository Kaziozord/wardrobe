FactoryGirl.define do
  factory :item_set, class: ItemSet do |i|
    i.name { Faker::Commerce.product_name }
    i.description { Faker::Lorem.sentence }
  end
end
