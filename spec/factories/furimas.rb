FactoryBot.define do
  factory :furima do
    title                 { 'test' }
    price                 { 10_000 }
    info                  { 'アイウエオ柿くけこ' }
    category_id           { 3 }
    item_status_id        { 2 }
    shipping_charge_id    { 2 }
    shipping_date_id      { 2 }
    prefecture_id         { 2 }

    after(:build) do |furima|
      furima.image.attach(io: File.open('public/images/test.png'), filename: 'test.png')
    end
    association :user
  end
end
