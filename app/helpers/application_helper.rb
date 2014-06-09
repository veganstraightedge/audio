module ApplicationHelper
  
  # previously in /lib/url.rb
  # module Url
  def sanatized_album_seo_path(album)
    album_seo_path(album, sanatize_for_url(album.name), sanatize_for_url(album.band.name))
  end

  def sanatized_band_seo_path(band)
    band_seo_path(band, sanatize_for_url(band.name))
  end

  def sanatized_song_seo_path(song)
    song_seo_path(song,
                  sanatize_for_url(song.pretty_name),
                  sanatize_for_url(song.album.band.name),
                  sanatize_for_url(song.album.name))
  end

  def sanatize_for_url(thing)
    thing.downcase.gsub(/&/, "and").gsub(/ /, "-").gsub(/,|\.|'|\/|\\|!|:|\?|#|\(|\)|\[|\]/, "").gsub(/--/, "-")
  end
  
end
