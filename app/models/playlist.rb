class Playlist < ActiveRecord::Base
	def self.add_song_to_playlist(playlist_id, song_id)
		return false if Playlist.where(playlist_id: playlist_id, song_id: song_id).to_a.size > 0

		new_added = Playlist.create(playlist_id: playlist_id, song_id: song_id)
		new_added
	end

	def self.searchByPlaylistId(playlist_id)
		songs = Playlist.where(playlist_id: playlist_id)
		songs
	end
end
