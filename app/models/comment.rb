class Comment < ApplicationRecord
  has_rich_text :content
  belongs_to :line_item

  validates :name, presence: true
  validate :filter_content

  private

  def filter_content
    errors.add(:content, "can't be empty") if rich_text_content.blank?
  end
end
