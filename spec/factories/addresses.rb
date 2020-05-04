FactoryBot.define do
  factory :address do
    send_first_name            {"姓"}
    send_name                  {"名"}
    send_first_name_kana       {"せい"}
    send_name_kana             {"な"}
    postal_code                {"1111111"}
    prefecture                   {"東京都"}
    city                         {"北区"}
    block                        {"1-1"}
    
  end
end