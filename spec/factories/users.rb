FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'test@example'}
    password              {'1030kt'}
    password_confirmation {password}
    last_name             {'拓也'}
    first_name            {'川本'}
    last_name_kana        {'タクヤ'}
    first_name_kana       {'カワモト'}
    birthday              {'1991-05-16'}
  end
end