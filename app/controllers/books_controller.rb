class BooksController < ApplicationController
  def index
    @books = Book.includes(:author).with_attached_cover_image
  end

  def show
    @book = Book.find(params[:id])
    @rentals = @book.rentals.includes(:user)
  end
end
