class AlbumsController < ApplicationController
  before_filter :login_required, :except => [:show, :index]

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

  def new
    @album = Album.new
  end

  def edit
    @album = Album.find(params[:id])
  end

  def create
    @album = Album.new(params[:album])

    if @album.save
      flash[:notice] = 'Album was successfully created.'
      redirect_to @album
    else
      render :action => "new"
    end
  end

  def update
    @album = Album.find(params[:id])

    if @album.update_attributes(params[:album])
      flash[:notice] = 'Album was successfully updated.'
      redirect_to @album
    else
      render :action => "edit"
    end
  end

  def destroy
    @album = Album.find(params[:id])
    @album.destroy
    redirect_to albums_path
  end
end
