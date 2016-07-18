class Items < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string   :name
      t.string   :description
      t.integer  :unit_price

      t.timestamps null: false
    end 
  end
end
