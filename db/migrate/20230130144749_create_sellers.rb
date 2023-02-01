class CreateSellers < ActiveRecord::Migration[7.0]
  def change
    create_table :sellers do |t|
      t.string :username
      t.integer :balance

      t.timestamps
    end
  end
end
