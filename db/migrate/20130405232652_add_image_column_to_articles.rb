class AddImageColumnToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :imageurl, :string
  end
end
