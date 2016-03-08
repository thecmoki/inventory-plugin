class CreateAmortnorms < ActiveRecord::Migration
  def change
    create_table :amortnorms do |t|
      t.string :name
      t.text :comment
    end
  end
end
