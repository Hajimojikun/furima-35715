class BuyItemsController < ApplicationController
before_action :authenticate_user!
before_action :find_params
before_action :move_to_index

  def index
    @buy_item_where_to = BuyItemWhereTo.new
  end

  def create
    @buy_item_where_to = BuyItemWhereTo.new(buy_item_where_to_params)
     if @buy_item_where_to.valid?
        pay_item
        @buy_item_where_to.save
        redirect_to root_path
     else
      render :index
     end
  end

  private
  def buy_item_where_to_params
    params.require(:buy_item_where_to).permit(:post_code, :city, :street, :name_of_the_building,:prefecture_id, :phone_number).merge(user_id: current_user.id ,
       item_id: params[:item_id],token: params[:token])
    end

    def pay_item
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
        Payjp::Charge.create(
          amount: @buy_item.price,
          card:  buy_item_where_to_params[:token],
          currency: 'jpy'
        )
    end
    def find_params
      @buy_item = Item.find(params[:item_id])
    end

    def move_to_index
      @buy_items = BuyItem.find_by(item_id: params[:item_id])
      redirect_to root_path if current_user.id == @buy_item.user_id || @buy_item.buy_item != nil
    end
end
