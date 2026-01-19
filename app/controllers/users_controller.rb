class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    rentals = @user.rentals
    @past_rentals = rentals.select { |r| r.start_date < Date.current }
    @future_rentals = rentals.select { |r| r.start_date >= Date.current }
  end
end
