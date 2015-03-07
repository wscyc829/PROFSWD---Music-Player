class PlaylistList < ActiveRecord::Base
	def self.create_playlist_for_user(user_id, playlist_name)
		return false if PlaylistList.where(user_id: user_id, playlist_name: playlist_name).to_a.size > 0

		new_list = PlaylistList.create(user_id: user_id, playlist_name: playlist_name)
		new_list
	end

	def self.searchById(id)
		list = PlaylistList.where(id: id)
		list
	end

	def self.searchByPlaylistName(playlist_name)
		list = PlaylistList.where(playlist_name: playlist_name)
		list
	end

	def self.searchByUserId(user_id)
		list = PlaylistList.where(user_id: user_id)
		list
	end

	def self.search(user_id, playlist_name)
		list = PlaylistList.where(user_id: user_id, playlist_name: playlist_name)
		list
	end
end
