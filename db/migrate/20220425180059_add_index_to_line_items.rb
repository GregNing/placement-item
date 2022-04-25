class AddIndexToLineItems < ActiveRecord::Migration[7.0]
  def change
    add_index :line_items, :name
  end
end
