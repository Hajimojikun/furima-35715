require 'rails_helper'

RSpec.describe BuyItem, type: :model do
  describe '商品購入' do 
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      @buy_item_where_to = FactoryBot.build(:buy_item_where_to, user_id: @user.id, item_id: @item.id)
      sleep(0.1)
    end

    context '商品の購入ができる' do 
      it "情報を正しく入力すると商品の購入ができる" do
        expect(@buy_item_where_to).to be_valid
      end
      it "電話番号が11桁なら購入できない" do
        @buy_item_where_to.phone_number = "12345678901"
        expect(@buy_item_where_to).to be_valid
      end
      it "市区町村がアルファベットでも購入できる" do
        @buy_item_where_to.city = "Cliffs"
        expect(@buy_item_where_to).to be_valid
      end
      it "番地がアルファベットでも購入できる" do
        @buy_item_where_to.street = "Street"
        expect(@buy_item_where_to).to be_valid
      end
      it "建物名は空でも登録できる" do
        @buy_item_where_to.name_of_the_building = ""
        expect(@buy_item_where_to).to be_valid
      end
      
    end

    context '商品の購入ができない' do 
      it "正しいカード情報(トークン)が存在しないと購入できない" do
        @buy_item_where_to.token = ""
        @buy_item_where_to.valid?
        expect(@buy_item_where_to.errors.full_messages).to include("クレジットカード情報を入力してください")
      end
      it "ポストコードが空だと購入できない" do
        @buy_item_where_to.post_code = ""
        @buy_item_where_to.valid?
        expect(@buy_item_where_to.errors.full_messages).to include("郵便番号を入力してください", "郵便番号が正しくありません (例 123-4567)")
      end
      it "ポストコードにハイフン（ー）が無いと購入できない" do
        @buy_item_where_to.post_code = "1234567"
        @buy_item_where_to.valid?
        expect(@buy_item_where_to.errors.full_messages).to include("郵便番号が正しくありません (例 123-4567)")
      end
      it "市区町村が空だと購入できない" do
        @buy_item_where_to.city = ""
        @buy_item_where_to.valid?
        expect(@buy_item_where_to.errors.full_messages).to include("市区町村を入力してください")
      end
      it "番地が空だと購入できない" do
        @buy_item_where_to.street = ""
        @buy_item_where_to.valid?
        expect(@buy_item_where_to.errors.full_messages).to include("番地を入力してください")
      end
      it "電話番号が空だと購入できない" do
        @buy_item_where_to.phone_number = ""
        @buy_item_where_to.valid?
        expect(@buy_item_where_to.errors.full_messages).to include("電話番号を入力してください", "電話番号が正しくありません")
      end
      it "電話番号が12桁以上では購入できない" do
        @buy_item_where_to.phone_number = "123456789098"
        @buy_item_where_to.valid?
        expect(@buy_item_where_to.errors.full_messages).to include("電話番号が正しくありません")
      end
      it "電話番号が11桁未満ではなら購入できない" do
        @buy_item_where_to.phone_number = "123456789"
        @buy_item_where_to.valid?
        expect(@buy_item_where_to.errors.full_messages).to include("電話番号が正しくありません")
      end
      it "電話番号が英数混合では登録できない" do
        @buy_item_where_to.phone_number = "1a2a3a4a5a6"
        @buy_item_where_to.valid?
        expect(@buy_item_where_to.errors.full_messages).to include("電話番号が正しくありません")
      end
      it "都道府県が空(1)だと購入できない" do
        @buy_item_where_to.prefecture_id = 1
        @buy_item_where_to.valid?
        expect(@buy_item_where_to.errors.full_messages).to include("都道府県を選んでください")
      end
      it "ユーザーのIDが空だと購入できない" do
        @buy_item_where_to.user_id = ""
        @buy_item_where_to.valid?
        expect(@buy_item_where_to.errors.full_messages).to include("Userを入力してください")
      end
      it "ItemのIDが空だと購入できない" do
        @buy_item_where_to.item_id = ""
        @buy_item_where_to.valid?
        expect(@buy_item_where_to.errors.full_messages).to include("Itemを入力してください")
      end
    end
  end
end