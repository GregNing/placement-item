# frozen_string_literal: true

require 'version_history'

class LineItem < ApplicationRecord
  include VersionHistory
  belongs_to :campaign
  has_many :comments
  has_many :history, class_name: 'LineItem::History', dependent: :destroy

  validates :name, :booked_amount, :actual_amount, :adjustments, presence: true
  after_commit -> { send_changes_to_version_history(self) }, on: :update
end
