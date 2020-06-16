class BooksController < ApplicationController
  skip_before_action :authenticate_user!, only:[:index, :show]
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.save

    redirect_to book_path(@book)
  end

  private

  def book_params
    params.require(:book).permit(:name, :year, :title, :description, :condition, :author, :price)
  end
end
