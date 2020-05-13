FactoryBot.define do
  factory :image do 
    url   {Rack::Test::UploadedFile.new(File.join(Rails.root,'spec/fixtures/images/icon-03.png'))}
    item_id {1}
    association :item
  end
end