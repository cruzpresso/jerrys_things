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

  def edit
    @item = Item.find params[:id]
  end

  def update
    @item = Item.find params[:id]
    if @item.update(item_params)
    else
    end
  end

  def destroy
    @item = Item.find params[:id]
    if @item.delete
      flash[:notice] = "Item saved"
      redirect_to items_path
    else
      flash[:alert]
      render :index
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :price, :photo, :status)
  end

end
