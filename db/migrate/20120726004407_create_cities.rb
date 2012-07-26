class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.integer :gold
      t.integer :food
      t.integer :population
      t.float :tax
      t.boolean :is_capital
      t.string :coordinate

      t.timestamps
    end
  end
end
