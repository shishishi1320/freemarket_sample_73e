require 'rails_helper'
describe Item do
  describe '#create' do 
    context '出品する商品が保存できる場合' do
      it "必須項目の画像、商品名、商品説明、カテゴリー,商品の状態、配送料の負担、発送元の地域,発送までの日数、価格,出品者があると保存ができる" do
        item = build(:item )
        item.images.build
        expect(item).to be_valid
      end

      it "ブランドが無くてもと保存ができる" do
        item = build(:item ,brand_id:nil)
        item.images.build
        expect(item).to be_valid
      end

      it "buyer_idが無くてもと保存ができる" do
        item = build(:item ,buyer_id:nil)
        item.images.build
        expect(item).to be_valid
      end

      it "statusが無くてもと保存ができる" do
        item = build(:item ,buyer_id:nil)
        item.images.build
        expect(item).to be_valid
      end

      it "商品説明が1000文字なら保存ができる" do
        item = build(:item ,text:"a" * 1000)
        item.images.build      
        expect(item).to be_valid
      end

      it "価格が999999円以下なら保存ができる" do
        item = build(:item ,price: 9999999)
        item.images.build
        expect(item).to be_valid
      end

      it "価格が300円以上なら保存ができる" do
        item = build(:item ,price: 300)
        item.images.build
        expect(item).to be_valid
      end
    end

    context '出品する商品が保存できない場合' do
      it " 画像が1枚以上ないとは保存できないこと" do
        item = build(:item)
        item.valid?
        expect(item.errors[:url]).to include("は1枚以上登録してください")
      end

      it " 出品者がないとは保存できないこと" do
        item = build(:item,seller_id:nil)
        item.valid?
        expect(item.errors[:seller_id]).to include("を入力してください")
      end

      it " 価格がないとは保存できないこと" do
        item = build(:item,price:nil)
        item.valid?
        expect(item.errors[:price]).to include("を入力してください")
      end

      it " 価格がないとは保存できないこと" do
        item = build(:item,price:nil)
        item.valid?
        expect(item.errors[:price]).to include("を入力してください")
      end

      it " 価格が9999999以上は保存できないこと" do
        item = build(:item,price:10000000)
        item.valid?
        expect(item.errors[:price]).to include("は10000000より小さい値にしてください")
      end

      it " 価格が299以下は保存できないこと" do
        item = build(:item,price:299)
        item.valid?
        expect(item.errors[:price]).to include("は299より大きい値にしてください")
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

      it " 商品説明が1000文字以上なら保存できないこと" do
        item = build(:item, text: "a" * 1001)
        item.valid?
        expect(item.errors[:text]).to include("は1000文字以内で入力してください")
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
end