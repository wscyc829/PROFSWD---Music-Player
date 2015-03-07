class RemoveUserIdInPlaylistLists < ActiveRecord::Migration
  def change
  	remove_column :playlist_lists, :user_id 
  end
end
