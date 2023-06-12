class AddHasWhatsappToDonations < ActiveRecord::Migration[7.0]
  def change
    add_column :donations, :has_whatsapp, :boolean, default: false, null: false
  end
end
