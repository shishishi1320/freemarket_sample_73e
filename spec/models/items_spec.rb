require 'rails_helper'
describe Item do
  describe '#create' do 

    it "必須項目の画像、商品名、商品説明、カテゴリー,商品の状態、配送料の負担、発送元の地域,発送までの日数、価格があると保存ができる" do
      url = Rack::Test::UploadedFile.new(File.join(Rails.root,'spec/fixtures/images/icon-03.png'))
      item = build(:item)
      item.images.build(url:url)
      expect(item).to be_valid
    end



    it "必須以外のブランドが無くてもと保存ができる" do
      url = Rack::Test::UploadedFile.new(File.join(Rails.root,'spec/fixtures/images/icon-03.png'))
      item = build(:item ,brand_id:nil)
      item.images.build(url:url)
      expect(item).to be_valid
    end

    it " 画像がない場合は保存できないこと" do
      item = build(:item)
      item.valid?
      expect(item.errors[:url]).to include("は1枚以上登録してください")
    end

    it " 商品名がない場合は保存できないこと" do
      item = build(:item, name: nil)
      item.valid?
      expect(item.errors[:name]).to include("を入力してください")
    end

    it " 商品説明がない場合は保存できないこと" do
      item = build(:item, text: nil)
      item.valid?
      expect(item.errors[:text]).to include("を入力してください")
    end

    it " カテゴリーがない場合は保存できないこと" do
      item = build(:item, category_id: nil)
      item.valid?
      expect(item.errors[:category_id]).to include("を入力してください")
    end

    it " 商品の状態がない場合は保存できないこと" do
      item = build(:item, condition: nil)
      item.valid?
      expect(item.errors[:condition]).to include("を入力してください")
    end

    it " 配送料の負担がない場合は保存できないこと" do
      item = build(:item, shipping_cost: nil)
      item.valid?
      expect(item.errors[:shipping_cost]).to include("を入力してください")
    end

    it " 配送方法がない場合は保存できないこと" do
      item = build(:item, delivery_method: nil)
      item.valid?
      expect(item.errors[:delivery_method]).to include("を入力してください")
    end

    it " 発送元の地域がない場合は保存できないこと" do
      item = build(:item, delivery_area: nil)
      item.valid?
      expect(item.errors[:delivery_area]).to include("を入力してください")
    end

    it " 配送日がない場合は保存できないこと" do
      item = build(:item, delivery_date: nil)
      item.valid?
      expect(item.errors[:delivery_date]).to include("を入力してください")
    end

    it " サイズがない場合は保存できないこと" do
      item = build(:item, size: nil)
      item.valid?
      expect(item.errors[:size]).to include("を入力してください")
    end
  end
end