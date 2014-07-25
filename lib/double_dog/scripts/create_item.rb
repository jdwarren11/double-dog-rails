module DoubleDog
  class CreateItem

    def run(params)
      params[:price] = params[:price].to_i 
      return failure(:not_admin) unless admin_session?(params[:session_id])
      return failure(:invalid_name) unless valid_name?(params[:name])
      return failure(:invalid_price) unless valid_price?(params[:price])

      item = DoubleDog.db.create_item(:name => params[:name], :price => params[:price])
      return success(:item => item)
    end

    def admin_session?(session_id)
      user = DoubleDog.db.get_user_by_session_id(session_id)
      user && user.admin?
    end

    def valid_name?(name)
      name != nil && name.length >= 1
    end

    def valid_price?(price)
      price != nil && price >= 0.50
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
