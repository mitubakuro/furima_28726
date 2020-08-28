class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :postal_code, null: false
      t.integer :shipping_area_id, null: false
      t.string :city, null: false
      t.string :addresses , null: false
      t.string :build_number, null: false
      t.string :tel, null: false
      t.references :order, null: false, foreign_key: true
      t.timestamps
    end
  end
end
