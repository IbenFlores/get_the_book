class BooksController < ApplicationController
  skip_before_action :authenticate_user!, only:[:index, :show]
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(book_params)
  end

  private

  def book_params
    params.require(:book).permit(:name, :year, :title, :description, :condition, :author, :price)
  end
end
