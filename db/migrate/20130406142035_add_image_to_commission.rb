class AddImageToCommission < ActiveRecord::Migration
  def change
    add_column :commissions, :image, :string
  end
end
