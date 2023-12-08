FactoryBot.define do
  factory :item do
    name { "Sample Item" }
    price { 1000 }
    description { "This is a sample description" }
    category_id { 1 }
    product_condition_id { 1 }
    shipping_cost_id { 1 }
    prefecture_id { 1 }
    days_to_ship_id { 1 }
    association :user
    trait :with_image do
      after(:build) do |item|
        item.image.attach(
          io: File.open(Rails.root.join('spec', 'fixtures', 'image.jpg')),
          filename: 'image.jpg',
          content_type: 'image/jpeg'
        )
      end
    end
  end
end