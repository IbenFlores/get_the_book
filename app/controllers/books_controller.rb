class BooksController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
<<<<<<< HEAD
  before_action :find_book, only: [:show, :edit]
=======
  before_action :find_book, only: [:show, :edit, :update, :destroy]
>>>>>>> 6d31acea60c3bcd099bb349e8109e745e8473cda

  def index
    @books = Book.all
  end

  def show
  end

  def edit
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

<<<<<<< HEAD
=======
  def edit
  end

  def destroy
    @book.destroy

    redirect_to books_path
  end

>>>>>>> 6d31acea60c3bcd099bb349e8109e745e8473cda
  private

  def find_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:name, :year, :title, :description, :condition, :author, :owner_id, :price)
  end
end
