class SongsController < ApplicationController
  def index
    @title = 'All Songs'
    @songs = Song.paginate(page: params[:page], per_page: 25)
  end

  def show
    @song = Song.find(params[:id])
    @title = @song.pretty_name + ' from ' + @song.album.name + ' by ' + @song.album.band.name

    redirect_to(sanatized_song_seo_path(@song)) unless request.path == sanatized_song_seo_path(@song)
  end
end
