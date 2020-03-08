class BandsController < ApplicationController
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
end
