class ItemsController < ApplicationController
  before_action :authenticate_user!, only:[:new,:create,:edit,:update]
  before_action :make_instance, only:[:show, :edit, :update]
  before_action :move_to, only:[:update,:dastroy]
  


  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @items = Item.new
  end

  def create
    @items = Item.new(items_params)
    if @items.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(items_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    item = Item.find(params[:id])
    if item.destroy
      redirect_to root_path
    end
  end

  private
  def items_params
    params.require(:item).permit(
      :name, :description, :price, :image, :category_id, :state_id, :who_pay_id, :due_day_id, :prefecture_id
    ).merge(user_id: current_user.id)
  end
  
  def move_to
    redirect_to root_path unless @item.user.id == current_user.id
  end

  def make_instance
    @item = Item.find(params[:id])
  end
end
