require 'rails_helper'
describe Image do
  describe '#create' do 

    it "urlがあると保存ができる" do
      image = build(:image)
      expect(image).to be_valid
    end

  end
end