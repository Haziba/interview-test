class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @current_rentals = Rental.where(user: @user).where("start_date <= ?", Date.current).where("end_date >= ?", Date.current)
    @past_rentals = Rental.where(user: @user).where("end_date <= ?", Date.current)
    @future_rentals = Rental.where(user: @user).where("start_date > ?", Date.current)
  end
end
