class BuyItemsController < ApplicationController
before_action :authenticate_user!, only:[:index, :create]

  def index
    @buy_item = Item.find(params[:item_id])
    @buy_item_where_to = BuyItemWhereTo.new
  end

  def create
    @buy_item_where_to = BuyItemWhereTo.new(buy_item_where_to_params)
     if @buy_item_where_to.valid?
        @buy_item_where_to.save
        redirect_to item_path(@buy_item_where_to.id)
     else
      render :index
     end
  end

  private
  def buy_item_where_to_params
    params.require(:buy_item).permit(:post_code, :city, :street, :name_of_the_building,:prefecture_id, :phone_number).merge(user_id: current_user.id ,
       item_id: params[:item_id] )
    end
end
