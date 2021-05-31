class ItemsController < ApplicationController
  before_action :authenticate_user!, only:[:new,:create]

  def index
  end

  def new
    @items = Item.new
    @user = @items.user
  end

  def create
    @items = Item.new(items_params)
    if @items.save
      redirect_to root_path
    else
      render :new
    end
  end


  private
  def items_params
    params.require(:item).permit(
      :name, :description, :price, :image, :category_id, :state_id, :who_pay_id, :due_day_id, :prefecture_id
    ).merge(user_id: current_user.id)
  end
end
