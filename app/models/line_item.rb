class LineItem < ApplicationRecord
  belongs_to :campaign

  validates :name, :booked_amount, :actual_amount, :adjustments, presence: true
end
