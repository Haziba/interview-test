class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
    rentals = @book.rentals
    @past_rentals = rentals.select { |r| r.start_date < Date.current }
    @future_rentals = rentals.select { |r| r.start_date >= Date.current }
  end
end
