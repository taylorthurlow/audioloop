class CreateArtists < ActiveRecord::Migration[5.1]
  def change
    create_table :artists do |t|
      t.string :name
      t.text :description
      t.string :image_url
      t.integer :discogs_id

      t.timestamps
    end
  end
end
