class CreateStocks < ActiveRecord::Migration
  def change
    create_table :stocks do |t|
      t.string :serial_nr
      t.string :product_name
      t.date :buy_date
      t.string :norma_amortizimit
      t.string :amortizimi
      t.string :neto_value
      t.string :color
      t.string :quantity
      t.string :comment
      t.integer :category_id
      t.integer :unit_id
    end
  end
end
