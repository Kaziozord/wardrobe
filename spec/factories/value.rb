FactoryGirl.define do
  factory :value, class: Value do |i|
    i.value { Faker::Number.number(2) }
  end
end
