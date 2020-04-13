class CreateShops < ActiveRecord::Migration[6.0]
  def change
    create_table :shops do |t|
      t.integer :user_id
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
