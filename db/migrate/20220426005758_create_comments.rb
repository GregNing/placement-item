class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.string :name
      t.references :line_item, index: true, foreign_key: true

      t.timestamps
    end
  end
end
