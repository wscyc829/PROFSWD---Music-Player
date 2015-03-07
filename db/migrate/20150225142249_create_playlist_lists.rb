class CreatePlaylistLists < ActiveRecord::Migration
  def change
    create_table :playlist_lists do |t|
      t.string :playlist_name
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
