class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name
      t.string(:prefix)
      t.text :description
    end
  end
end
