class CreateLineItems < ActiveRecord::Migration[7.0]
  def change
    create_table :line_items do |t|
      t.string :name, null: false
      t.float :booked_amount
      t.float :actual_amount
      t.float :adjustments
      t.references :campaign, index: true, foreign_key: true

      t.timestamps
    end
  end
end
