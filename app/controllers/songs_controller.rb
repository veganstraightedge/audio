class SongsController < ApplicationController
  before_filter :login_required, :except => [:show, :index]

  def index
    @title = "All Songs"
    @songs = Song.paginate(:page => params[:page], :per_page => 25)
  end

  def show
    @song = Song.find(params[:id])
    @title = @song.pretty_name + " from " + @song.album.name + " by " + @song.album.band.name

    unless request.path == sanatized_song_seo_path(@song)
      return redirect_to(sanatized_song_seo_path(@song))
    end
  end

  def new
    @song = Song.new
  end

  def edit
    @song = Song.find(params[:id])
  end

  def create
    @song = Song.new(params[:song])

    if @song.save
      flash[:notice] = "Song (#{@song.pretty_name}) was successfully created."
      redirect_to new_song_path
    else
      render :action => "new"
    end
  end

  def update
    @song = Song.find(params[:id])

    if @song.update_attributes(params[:song])
      flash[:notice] = 'Song was successfully updated.'
      redirect_to @song
    else
      render :action => "edit"
    end
  end

  def destroy
    @song = Song.find(params[:id])
    @song.destroy
    redirect_to songs_path
  end
end
