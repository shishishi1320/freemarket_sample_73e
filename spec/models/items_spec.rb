require 'rails_helper'
describe Item do
  describe '#create' do 

    it "dddd" do
      item = build(:item)
      expect(item).to be_valid
    end


  end
end