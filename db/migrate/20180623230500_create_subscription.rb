class CreateSubscription < ActiveRecord::Migration[5.1]
  def change
    create_table :subscriptions do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :artist, foreign_key: true
      t.boolean :track_albums, default: true
      t.boolean :track_singles, default: true
      t.boolean :track_eps, default: true
    end
  end
end
