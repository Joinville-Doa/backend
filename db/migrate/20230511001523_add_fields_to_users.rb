class AddFieldsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :name, :text
    add_column :users, :document_number, :text
    add_column :users, :date_of_birth, :text
    add_column :users, :phone, :text
    add_column :users, :accept_terms_of_use, :boolean, default: false
  end
end
