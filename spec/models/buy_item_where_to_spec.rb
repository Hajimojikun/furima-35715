require 'rails_helper'

RSpec.describe BuyItem, type: :model do
  describe '商品購入' do 
    before do
      @buy_item_where_to = FactoryBot.build(:buy_item_where_to)
    end

    context '商品の購入ができる' do 
      it "情報を正しく入力すると商品の購入ができる" do
        expect(@buy_item_where_to).to be_valid
      end

    end

    context '商品の購入ができない' do 
      it "" do
      end
    end

  end
end