class AlbumsController < ApplicationController
  def index
    @title = "All Albums"
    @albums = Album.all
  end

  def show
    @album = Album.find(params[:id])
    @title = @album.name + " by " + @album.band.name

    unless request.path == sanatized_album_seo_path(@album)
      return redirect_to(sanatized_album_seo_path(@album))
    end
  end
end
