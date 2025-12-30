class CreateOrders < ActiveRecord::Migration[8.1]
  def change
    create_table :orders do |t|
      t.references :customer, null: false, foreign_key: true
      t.decimal :total, null: false, default: 0
      t.datetime :ordered_at

      t.timestamps
    end
  end
end
