class AddListedToItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :listed, :boolean, default: true
  end
end
