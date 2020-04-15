class AddStatusToShop < ActiveRecord::Migration[6.0]
  def change
    add_column :shops, :status, :boolean, default: true
  end
end
