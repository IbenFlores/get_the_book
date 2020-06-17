class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @book = Book.find(params[:book_id])
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.book_id = params[:book_id]
    @booking.user_id = current_user.id
    authorize @booking
    if @booking.save
      redirect_to books_path
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
