FactoryBot.define do

  factory :brands do
    association :user
    name              {"abe"}
    user
  end
end