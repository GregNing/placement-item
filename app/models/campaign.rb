class Campaign < ApplicationRecord
  has_many :items, class_name: 'LineItem'
end
