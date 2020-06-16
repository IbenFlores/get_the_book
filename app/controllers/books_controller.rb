class BooksController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :new, :create]
  before_action :find_book, only: :show

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
    @book.owner_id = current_user.id

    if @book.save
      redirect_to book_path(@book)
    else
      render :new
    end
  end

  private

  def find_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:name, :year, :title, :description, :condition, :author, :price, :owner_id)
  end
end
