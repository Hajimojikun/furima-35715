require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品の出品'do
  before do 
    @item = FactoryBot.build(:item)
  end
  context '商品の出品ができる' do 
    it '全部入力すると出品ができること' do
    expect(@item).to be_valid
    end

    it "販売価格は、¥300~¥9,999,999の間のみ保存可能であること" do
      @item.price = 80000
      expect(@item).to be_valid
    end

    it "販売価格は半角数字保存可能であること" do
      @item.price = 499
      expect(@item).to be_valid
    end
  end

  context '商品の出品ができない' do 
    it "商品名が無いと出品できない" do
      @item.name = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it "商品の説明が無いと出品できない" do
      @item.description = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end

    it "カテゴリの情報が必須であること" do
      @item.category_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank","Category is not a number")
    end

    it "カテゴリの選択番号が１では登録できない" do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 1")
    end

    it "カテゴリの情報は数字でないと登録できない" do
      @item.category_id = "３"
      @item.valid?
      expect(@item.errors.full_messages).to include("Category is not a number")
    end

    it "商品の状態についての情報が必須であること" do
      @item.state_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("State can't be blank","State is not a number")
    end

    it "商品の状態の選択番号が１では登録できない" do
      @item.state_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("State must be other than 1")
    end

    it "商品の状態の情報は数字でないと登録できない" do
      @item.state_id = "２"
      @item.valid?
      expect(@item.errors.full_messages).to include("State is not a number")
    end
    it "発送料の負担についての情報が必須であること" do
      @item.who_pay_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Who pay can't be blank", "Who pay is not a number")
    end

    it "発送料の負担の選択番号が１では登録できない" do
      @item.who_pay_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Who pay must be other than 1")
    end

    it "発送料の負担の情報は数字でないと登録できない" do
      @item.who_pay_id = "２"
      @item.valid?
      expect(@item.errors.full_messages).to include("Who pay is not a number")
    end

    it "発送元の地域についての情報が必須であること" do
      @item.prefecture_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture can't be blank", "Prefecture is not a number")
    end

    it "発送元の地域の選択番号が１では登録できない" do
      @item.prefecture_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
    end

    it "発送元の地域の情報は数字でないと登録できない" do
      @item.prefecture_id = "２"
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture is not a number")
    end

    it "発送までの日にちについての情報が必須であること" do
      @item.due_day_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Due day can't be blank", "Due day is not a number")
    end

    it "発送までの日にちの選択番号が１では登録できない" do
      @item.due_day_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Due day must be other than 1")
    end

    it "発送までの日にちの情報は数字でないと登録できない" do
      @item.due_day_id = "２"
      @item.valid?
      expect(@item.errors.full_messages).to include("Due day is not a number")
    end

    it "販売価格の情報が必須であること" do
      @item.price = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank", "Price is invalid", "Price is not included in the list")
    end
    
    it "販売価格は、¥300未満の金額は保存不可能であること" do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not included in the list")
    end
    
    it "販売価格は、¥9,999,999超える金額は保存不可能であること" do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not included in the list")
    end
    
    it "販売価格は半角数字以外保存不可能であること" do
      @item.price = "３５６"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not included in the list")
    end

    it '商品価格が半角英数字混合では出品できない' do 
      @item.price = "89ui"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not included in the list")
    end
    
    it '商品価格が半角英字のみでは出品できない' do 
      @item.price = "titotot"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not included in the list")
    end

    it "商品画像は１枚つけることが必須である" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it "userの情報が無いと保存できない" do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("User can't be blank", "User must exist")
    end
  end
 end
end
