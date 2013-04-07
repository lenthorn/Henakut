class AddImageToCommissions < ActiveRecord::Migration
  def change
    add_column :commissions, :image, :string
  end
end
