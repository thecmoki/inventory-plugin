class CreateInventories < ActiveRecord::Migration
  def change
    create_table :inventories do |t|
      t.integer :room_id
      t.date :time_of_use
      t.integer :user_id
      t.integer :stock_id
    end
  end
end
