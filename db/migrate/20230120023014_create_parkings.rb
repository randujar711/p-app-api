class CreateParkings < ActiveRecord::Migration[7.0]
  def change
    create_table :parkings do |t|
      t.string :latitude
      t.string :longitude
      t.integer :price
      t.date :date
      t.boolean :occupied, default: false
      t.integer :seller_id
      t.integer :user_id
      t.timestamps
    end
  end
end
