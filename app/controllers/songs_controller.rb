class SongsController < ApplicationController
  def index
    @title = 'All Songs'
    @songs = Song.paginate(page: params[:page], per_page: 25)
  end

  def show
    @song = Song.find(params[:id])
    set_title

    redirect_to_seo_path
  end

  private

  def set_title
    @title = [@song.pretty_name,
              'from',
              @song.album.name,
              'by',
              @song.album.band.name].join ' '
  end

  def redirect_to_seo_path
    return if request.path == sanatized_song_seo_path(@song)

    redirect_to(sanatized_song_seo_path(@song))
  end
end
