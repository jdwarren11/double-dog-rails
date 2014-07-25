class ItemsController < ApplicationController
  def index
    @items = DoubleDog.db.all_items
    @item = DoubleDog::Item.new(nil, nil, nil)
  end

  def show
    @item = DoubleDog.db.get_item(params[:id].to_i)
  end
# transaction scripts if data is modified!!!!
  def new
    @item = DoubleDog::Item.new(nil, nil, nil)
  end

  def create
    # p = item_params
    item_parameters = { name: params[:item][:name], price: params[:item][:price].to_i, session_id: $session_id}
    result = DoubleDog::CreateItem.new.run(item_parameters)
    # @item = DoubleDog::CreateItem.new.run(params)
    if result[:success?]
      redirect_to root_path
    else
      @items = DoubleDog.db.all_items
      @error = result[:error]
      @item = DoubleDog::Item.new(nil, params[:name], params[:price])
      render 'index'
    end
  end

  def edit
    @item = DoubleDog.db.get_item(params[:id].to_i)
  end

  def update
    @item = DoubleDog.db.get_item(params[:id].to_i)
    @item.update(item_params)
    redirect_to root_path
  end


  private
  def item_params
    params.require(:item).permit(:name, :price)
  end
end
