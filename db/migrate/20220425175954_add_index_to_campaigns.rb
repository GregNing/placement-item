class AddIndexToCampaigns < ActiveRecord::Migration[7.0]
  def change
    add_index :campaigns, :name
  end
end
