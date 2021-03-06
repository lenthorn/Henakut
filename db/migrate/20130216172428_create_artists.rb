class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.string :artistname
      t.text :bio
      t.string :artistimage_url
      t.string :arttype
      t.string :artstyle
      t.boolean :featuredartist

      t.timestamps
    end
  end
end
