class CreateRoutes < ActiveRecord::Migration
  def change
    create_table :routes do |t|
      t.string :source, null: false
      t.string :destination, null: false

      t.timestamps null: false
    end
  end
end
