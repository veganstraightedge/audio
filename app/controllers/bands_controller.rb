class BandsController < ApplicationController
  def index
    @title = 'All Bands'
    @bands = Band.all.sort_by(&:name)
  end

  def show
    @band = Band.find(params[:id])
    @title = @band.name

    redirect_to_seo_path
  end

  private

  def redirect_to_seo_path
    return if request.path == sanatized_band_seo_path(@band)

    redirect_to(sanatized_band_seo_path(@band))
  end
end
