FactoryBot.define do
  factory :purchase_customer do
    postal_code    { '123-4567' }
    prefecture_id  { 2 }
    municipality   { '大阪市' }
    address        { '3−４' }
    building       { '国会議じdo' }
    phone_number   { 12312341234 }
    token          {"tok_abcdefghijk00000000000000000"}
  end
end