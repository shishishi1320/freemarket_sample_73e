require 'rails_helper'
describe User do
  describe '#create' do 

    it " nickname,email,password,password_confirmation,first_name,name,first_name_kana,name_kana,birthがない場合は登録できないこと" do
      user = build(:user)
      expect(user).to be_valid
    end

    it " nicknameがない場合は登録できないこと" do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("を入力してください")
    end

    it " emailがない場合は登録できないこと" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end

    it " 同じemailがすでに保存している時は登録できないこと" do
      user = build(:user)
      user.save
      user_two = build(:user, email: "kkk@gmail.com")
      user_two.valid?
      expect(user_two.errors[:email]).to include("はすでに存在します")
    end

    it " passwordがない場合は登録できないこと" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end
    
    it " passwordは7文字以下は登録できないこと" do
      user = build(:user, password: "123456", password_confirmation: "123456")
      user.valid?
      expect(user.errors[:password]).to include("は7文字以上で入力してください")
    end

    it "password,password_confirmationが7文字以上の場合は登録できること" do
      user = build(:user,password: "1234567", password_confirmation: "1234567")
      expect(user).to be_valid
    end

    it " passwordは確認ようも含めて2回入力すること" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
    end



    it " first_nameがない場合は登録できないこと" do
      user = build(:user, first_name: nil)
      user.valid?
      expect(user.errors[:first_name]).to include("を入力してください")
    end

    it " nameがない場合は登録できないこと" do
      user = build(:user, name: nil)
      user.valid?
      expect(user.errors[:name]).to include("を入力してください")
    end    

    it " first_nameが半角だと登録できないこと" do
      user = build(:user, first_name: "hankaku")
      user.valid?
      expect(user.errors[:first_name]).to include("全角で入力して下さい")
    end

    it " nameが半角だと登録できないこと" do
      user = build(:user, name: "hankaku")
      user.valid?
      expect(user.errors[:name]).to include("全角で入力して下さい")
    end


    it " first_name_kanaがない場合は登録できないこと" do
      user = build(:user, first_name_kana: nil)
      user.valid?
      expect(user.errors[:first_name_kana]).to include("を入力してください")
    end

    it " name_kanaがない場合は登録できないこと" do
      user = build(:user, name_kana: nil)
      user.valid?
      expect(user.errors[:name_kana]).to include("を入力してください")
    end    

    it " first_name_kanaが半角だと登録できないこと" do
      user = build(:user, first_name_kana: "hankaku")
      user.valid?
      expect(user.errors[:first_name_kana]).to include("全角で入力して下さい")
    end

    it " name_kanaが半角だと登録できないこと" do
      user = build(:user, name_kana: "hankaku")
      user.valid?
      expect(user.errors[:name_kana]).to include("全角で入力して下さい")
    end

    it " birthがない場合は登録できないこと" do
      user = build(:user, birth: nil)
      user.valid?
      expect(user.errors[:birth]).to include("を入力してください")
    end
  end
end