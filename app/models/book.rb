class Book < ApplicationRecord
  has_many :bookings, dependent: :destroy
  has_many :users, through: :bookings
  validates :title, presence: true
  validates :year, presence: true
  validates :author, presence: true
  validates :price, presence: true
  validates :condition, presence: true
  has_one_attached :photo

  def owner
    User.find(owner_id)
  end
end
