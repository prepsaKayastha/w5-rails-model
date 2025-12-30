class CreateShippingDetails < ActiveRecord::Migration[8.1]
  def change
    create_table :shipping_details do |t|
      t.references :order, null: false, foreign_key: true, index: { unique: true }
      t.string :address_line1, null: false
      t.string :city, null: false
      t.string :state
      t.datetime :shipped_at

      t.timestamps
    end
  end
end
