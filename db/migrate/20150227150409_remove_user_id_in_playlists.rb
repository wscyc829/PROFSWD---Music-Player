class RemoveUserIdInPlaylists < ActiveRecord::Migration
  def change
  	remove_column :playlists, :user_id 
  end
end
