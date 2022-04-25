class Campaign < ApplicationRecord
  has_many :items, class_name: 'LineItem'
  scope :recent, -> { order('created_at DESC') }

  validates :name, presence: true
end
