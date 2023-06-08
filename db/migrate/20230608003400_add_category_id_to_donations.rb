class AddCategoryIdToDonations < ActiveRecord::Migration[7.0]
  def change
    add_column :donations, :category_id, :integer
    add_index :donations, :category_id

    drop_table :categorizations
  end
end
