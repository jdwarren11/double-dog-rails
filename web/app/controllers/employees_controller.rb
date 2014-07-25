class EmployeesController < ApplicationController
  def index
    @employees = DoubleDog.db.all_users
  end

  def show
    @employee = DoubleDog.db.get_user(params[:id].to_i)
    @orders = DoubleDog.db.get_orders_by_employee(params[:id].to_i)
  end

  def create
  end

  private
  def employee_params
    params.require(:employee).permit(:id, :username)
  end
end
