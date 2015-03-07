class MusicPlayerController < ApplicationController
  require 'mp3info'
  require 'fileutils'
  protect_from_forgery with: :exception

  def music_player
    @name = "none"
    @musics = Dir.glob("public/data/*.mp3")

    user_id = session[:user_id]

    @playlist_list = PlaylistList.searchByUserId(user_id).to_a;

    @songs = Array.new
    if @playlist_list.to_a.size > 0
      
      if session[:playlist_id] == nil
        playlist_id = @playlist_list.first.id;
        session[:playlist_id] = playlist_id
      else
        playlist_id = session[:playlist_id]
      end
      song_ids = Playlist.searchByPlaylistId(playlist_id);

      song_ids.each do |song|
        @songs += Song.searchBySongId(song.song_id);
      end
    end

  end

  def upload

    if !params[:upload].blank? && session[:playlist_id] != nil
      file = params[:upload]
  	
      url =  file.original_filename
      url = File.basename(url)
      url.sub(/[^\w\.\-]/,'_')
     
      directory = "public/data"
      # create the file path
      path = File.join(directory, url)
      # write the file
      File.open(path, "wb") { |f| f.write(file.read) }
     
      Mp3Info.open(path) do |mp3|
        title = mp3.tag.title 
        artist = mp3.tag.artist
        album = mp3.tag.album

        session[:title] = title
        session[:artist] = artist
        session[:album] = album

        song = Song.upload(title, artist, album, url)
        playlist_id = session[:playlist_id]

        if song
          list = Playlist.add_song_to_playlist(playlist_id, song.id)
        else
          song = Song.search(title, artist, album, url).first
          list = Playlist.add_song_to_playlist(playlist_id, song.id)
        end
      end
    end

    redirect_to '/music_player'
  end 

  def create_new_playlist
    playlist_name = params[:playlist_name]
    user_id = session[:user_id]

    if playlist_name.size > 0
      new_list = PlaylistList.create_playlist_for_user(user_id, playlist_name)
      if new_list
        session[:playlist_id] = new_list.id
      end
    end

     redirect_to '/music_player'
  end

  def add_song_to_playlist

    playlist_id = params[:playlist_id]
    song_id = params[:song_id]

    added =Playlist.add_song_to_playlist(playlist_id, song_id);

    redirect_to '/music_player'
  end

  def switch_playlist
    playlist_id = params[:playlist_id]
    session[:playlist_id] = playlist_id

   redirect_to '/music_player'
  end

  def delete_song
    user_id = session[:user_id]
    playlist_id = session[:playlist_id]
    song_id = params[:song_id]

    song = Song.searchBySongId(song_id).first

    Playlist.where(song_id: song_id).first.destroy

    redirect_to '/music_player'
  end

end