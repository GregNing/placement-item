class CreateLineItemHistories < ActiveRecord::Migration[7.0]
  def change
    create_table :line_item_histories do |t|
      t.string :name
      t.float :booked_amount
      t.float :actual_amount
      t.float :adjustments

      t.references :line_item, index: true, foreign_key: true
      t.timestamps
    end
  end
end
