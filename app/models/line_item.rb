class LineItem < ApplicationRecord
  belongs_to :campaign
  has_many :comments

  validates :name, :booked_amount, :actual_amount, :adjustments, presence: true
end
