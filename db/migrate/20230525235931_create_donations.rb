class CreateDonations < ActiveRecord::Migration[6.1]
  def change
    create_table :donations do |t|
      t.references :user, null: false, foreign_key: true
      t.json :images
      t.string :title, null: false
      t.text :description
      t.integer :category_id, null: false
      t.string :phone_contact
      t.boolean :new_product

      t.timestamps
    end
  end
end
