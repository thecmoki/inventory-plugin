class CreateUnits < ActiveRecord::Migration
  def change
    create_table :units do |t|
      t.integer :category_id
      t.string :name
      t.string :quantity, :default => "1"
      t.text :comment
      t.timestamps null: false
    end
  end
end
