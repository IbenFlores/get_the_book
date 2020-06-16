class BooksController < ApplicationController
  skip_before_action :authenticate_user!, only:[:index, :show]
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  private

  def book_params
    params.require(:book).permit(:name, :year, :title, :description, :condition, :author, :owner_id, :price)
  end
end
