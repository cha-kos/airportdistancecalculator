class CreateAirports < ActiveRecord::Migration
  def change
    create_table :airports do |t|
      t.integer :lat, null: false
      t.integer :lon, null: false
      t.string :name, null: false
      t.string :city, null: false
      t.string :state_full, null: false
      t.string :state_abd, null: false
      t.string :code

      t.timestamps null: false
    end
  end
end
