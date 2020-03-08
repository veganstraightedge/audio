class BandsController < ApplicationController
  before_filter :login_required, :except => [:index, :show]

  def index
    @title = "All Bands"
    @bands = Band.all.sort_by{ |b| b.name }
  end

  def show
    @band = Band.find(params[:id])
    @title = @band.name

    unless request.path == sanatized_band_seo_path(@band)
      return redirect_to(sanatized_band_seo_path(@band))
    end
  end

  def new
    @band = Band.new
  end

  def edit
    @band = Band.find(params[:id])
  end

  def create
    @band = Band.new(params[:band])

    if @band.save
      flash[:notice] = 'Band was successfully created.'
      redirect_to @band
    else
      render :action => "new"
    end
  end

  def update
    @band = Band.find(params[:id])

    if @band.update_attributes(params[:band])
      flash[:notice] = 'Band was successfully updated.'
      redirect_to @band
    else
      render :action => "edit"
    end
  end

  def destroy
    @band = Band.find(params[:id])
    @band.destroy
    redirect_to bands_path
  end
end
