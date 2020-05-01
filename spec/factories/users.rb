FactoryBot.define do

  factory :user do
    nickname              {"abe"}
    email                 {"kkk@gmail.com"}
    password              {"00000000"}
    password_confirmation {"00000000"}
    first_name            {"姓"}
    name                  {"名"}
    first_name_kana       {"せい"}
    name_kana             {"な"}
    birth                 {"2012-06-15"}

  end
end