require 'rails_helper'
describe Address do
  describe '#create' do 

    it " send_first_name,send_name,send_first_name_kana,send_name_kana,postal_code,prefecture,city,blockがない場合は登録できないこと" do
      address = build(:address)
      expect(address).to be_valid
    end

    it " send_first_nameがない場合は登録できないこと" do
      address = build(:address, send_first_name: nil)
      address.valid?
      expect(address.errors[:send_first_name]).to include("を入力してください")
    end

    it " send_nameがない場合は登録できないこと" do
      address = build(:address, send_name: nil)
      address.valid?
      expect(address.errors[:send_name]).to include("を入力してください")
    end

    it " send_first_name_kanaがない場合は登録できないこと" do
      address = build(:address, send_first_name_kana: nil)
      address.valid?
      expect(address.errors[:send_first_name_kana]).to include("を入力してください")
    end
 
    it " send_name_kanaがない場合は登録できないこと" do
      address = build(:address, send_name_kana: nil)
      address.valid?
      expect(address.errors[:send_name_kana]).to include("を入力してください")
    end

    it " postal_codeがない場合は登録できないこと" do
      address = build(:address, postal_code: nil)
      address.valid?
      expect(address.errors[:postal_code]).to include("を入力してください")
    end

    it " prefectureがない場合は登録できないこと" do
      address = build(:address, prefecture: nil)
      address.valid?
      expect(address.errors[:prefecture]).to include("を入力してください")
    end

    it " cityがない場合は登録できないこと" do
      address = build(:address, city: nil)
      address.valid?
      expect(address.errors[:city]).to include("を入力してください")
    end

    it " blockがない場合は登録できないこと" do
      address = build(:address, block: nil)
      address.valid?
      expect(address.errors[:block]).to include("を入力してください")
    end
  end
end