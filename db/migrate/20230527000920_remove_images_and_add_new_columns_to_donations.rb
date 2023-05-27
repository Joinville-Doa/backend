class RemoveImagesAndAddNewColumnsToDonations < ActiveRecord::Migration[7.0]
  def change
    remove_column :donations, :images, :json

    add_column :donations, :image_one, :string
    add_column :donations, :image_two, :string
    add_column :donations, :image_three, :string
    add_column :donations, :image_four, :string
    add_column :donations, :image_five, :string
  end
end
