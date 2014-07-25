module DoubleDog
  class CreateOrder
    def run(params)
      user = DoubleDog.db.get_user_by_session_id(params[:session_id])
      return failure(:invalid_session) if user.nil?
      return failure(:no_items_ordered) unless valid_items?(params[:items])

      item_arr = []
      item_obj = params[:items].each do |item_id|
        item_arr << DoubleDog.db.get_item(item_id.to_i)
      end

      # order = DoubleDog.db.create_order(employee_id: user.id, items: params[:items])
      order = DoubleDog.db.create_order(employee_id: user.id, items: item_arr)
      return success(order: order)
    end

    def valid_items?(items)
      items != nil && items.count >= 1
    end

  private

    def failure(error_name)
      return :success? => false, :error => error_name
    end

    def success(data)
      return data.merge(:success? => true)
    end
  end
end