FactoryBot.define do
  factory :user do
    nickname              { 'test' }
    email                 { Faker::Internet.free_email }
    password              { '1030kt' }
    password_confirmation { password }
    last_name             { '拓也' }
    first_name            { '佐々木' }
    last_name_kana        { 'タクヤ' }
    first_name_kana       { 'カワモトー' }
    birthday              { '1991-05-16' }
  end
end
