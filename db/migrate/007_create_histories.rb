class CreateHistories < ActiveRecord::Migration
  def change
    create_table :histories do |t|
      t.integer :inventory_id
      t.string :user_name
      t.string :user_login
      t.string :room_name
      t.string :product_name
      t.string :product_id
      t.string :serial_number
      t.date :buy_date
      t.date :activation_date
      t.string :amortization_norm
      t.string :amortization
      t.string :neto_value
      t.string :time_of_use
      t.text :comment
      t.timestamps null: false
    end
  end
end
