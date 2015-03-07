class AddUserIdToPlaylistList < ActiveRecord::Migration
  def change
  	add_column :playlist_lists, :user_id, :integer
  end
end
