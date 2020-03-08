class BandsController < ApplicationController
  def index
    @title = 'All Bands'
    @bands = Band.all.sort_by(&:name)
  end

  def show
    @band = Band.find(params[:id])
    @title = @band.name

    unless request.path == sanatized_band_seo_path(@band)
      redirect_to(sanatized_band_seo_path(@band))
    end
  end
end
