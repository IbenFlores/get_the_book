class BooksController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :find_book, only: :show
  def index
    @books = Book.all
  end

  def show
  end

  private

  def find_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:name, :year, :title, :description, :condition, :author, :price, :owner_id)
  end
end
