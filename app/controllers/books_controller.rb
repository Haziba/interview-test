class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
    @current_rentals = Rental.where(book: @book).where("start_date <= ?", Date.current).where("end_date >= ?", Date.current)
    @past_rentals = Rental.where(book: @book).where("end_date <= ?", Date.current)
    @future_rentals = Rental.where(book: @book).where("start_date > ?", Date.current)
  end
end
