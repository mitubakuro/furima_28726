class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :item_name, null: false
      t.text :item_text, null: false
      t.integer :item_price, null: false
      t.integer :deli_fee, null: false
      t.integer :condition, null: false
      t.integer :category, null: false
      t.integer :shipping_day, null: false
      t.integer :shipping_area, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
