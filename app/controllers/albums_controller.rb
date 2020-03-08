class AlbumsController < ApplicationController
  def index
    @title = 'All Albums'
    @albums = Album.all
  end

  def show
    @album = Album.find(params[:id])
    @title = @album.name + ' by ' + @album.band.name

    redirect_to_seo_path
  end

  private

  def redirect_to_seo_path
    return if request.path == sanatized_album_seo_path(@album)

    redirect_to(sanatized_album_seo_path(@album))
  end
end
