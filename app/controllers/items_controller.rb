class ItemsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @new_item = Item.new
  end

  def create
    @new_item = Item.new(item_params)
    @new_item.user = current_user

    if @new_item.save
      redirect_to item_path(@new_item)
    else
      render :new
    end
  end

  def edit
    @edit_item = Item.find(params[:id])
  end

  def update
    update_item = Item.find(params[:id])
    update_item.update(item_params)

    redirect_to item_path(update_item)
  end

  def destroy
    delete_item = Item.find(params[:id])
    delete_item.destroy

    redirect_to items_path
  end

  private

  def item_params
    params.require(:item).permit(:title, :price, :description)
  end
end
