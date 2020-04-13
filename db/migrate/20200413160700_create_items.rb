class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.integer :shop_id
      t.text :description
      t.string :name
      t.decimal :price
      t.integer :quantity

      t.timestamps
    end
  end
end
