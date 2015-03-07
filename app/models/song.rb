class Song < ActiveRecord::Base
	belongs_to :user

	def self.upload(title, artist, album, url)
		return false if Song.where(title: title, artist: artist, album: album, url: url).to_a.size > 0
		new_song = Song.create(title: title, artist: artist, album: album, url: url)
		new_song
	end

	def self.search(title, artist, album, url)
		song = Song.where(title: title, artist: artist, album: album, url: url)
		song
	end

	def self.searchBySongId(song_id)
		song = Song.where(id: song_id)
		song
	end
end
