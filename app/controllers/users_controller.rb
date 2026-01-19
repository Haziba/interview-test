class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @rentals = @user.rentals.includes(book: :author)
  end
end
