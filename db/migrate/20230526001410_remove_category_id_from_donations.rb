class RemoveCategoryIdFromDonations < ActiveRecord::Migration[7.0]
  def change
    remove_column :donations, :category_id
  end
end
