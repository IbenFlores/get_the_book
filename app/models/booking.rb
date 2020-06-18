class Booking < ApplicationRecord
  belongs_to :book
  belongs_to :user

  def booked?
    bookings.any?
  end
end
