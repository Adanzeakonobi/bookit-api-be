class CreateVehicles < ActiveRecord::Migration[7.0]
  def change
    create_table :vehicles do |t|
      t.string :name
      t.money :price
      t.text :image
      t.boolean :visible

      t.timestamps
    end
  end
end
