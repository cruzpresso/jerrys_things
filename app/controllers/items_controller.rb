class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new item_params
    if @item.save
      flash[:notice] = "Item saved"
      redirect_to items_path
    else
      flash[:alert]
      render :new
    end
  end

  def show
    @item = Item.find params[:id]
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :price, :photo, :status)
  end

end
