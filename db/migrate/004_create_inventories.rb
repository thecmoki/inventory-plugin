class CreateInventories < ActiveRecord::Migration
  def change
    create_table :inventories do |t|
      t.string :user_name
      t.string :user_login
      t.string :room_name
      t.string :product_name
      t.string :serial_number
      t.date :buy_date
      t.date :activation_date
      t.string :amortization_norm
      t.string :amortization
      t.string :neto_value
      t.string :time_of_use
      t.string :comment
      t.timestamps null: false
    end
  end
end