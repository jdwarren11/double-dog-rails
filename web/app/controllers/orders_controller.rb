class OrdersController < ApplicationController

  def index
    @orders = DoubleDog.db.all_orders
  end

  def show
    @order = DoubleDog.db.get_order(params[:id].to_i)
  end
# transaction scripts if data is modified!!!!
  def new
    @items = DoubleDog.db.all_items
  end

  def create
    order_parameters = {:session_id => $session_id, :items => params[:item_ids]}
    result = DoubleDog::CreateOrder.new.run(order_parameters)
    if result[:success?]
      redirect_to '/orders'
    else
      @error = result[:error]
      render '/orders/new'

    end
  end

  def edit
    
  end

  def update
    
  end


  private
  def order_params
    params.require(:order).permit(:employee_id, :items)
  end
end
