Rails.application.routes.draw do
  get 'bands/index'
  get 'bands/show'
  root "bands#index"

  resources  :albums, :bands, :songs, :quotes, only: [:index, :show]

  get "/bands/:id/:band"                      => "bands#show",  as: "band_seo"
  get "/albums/:id/:album/by/:band"           => "albums#show", as: "album_seo"
  get "/songs/:id/:song/by/:band/from/:album" => "songs#show",  as: "song_seo"
  get "/songs/page/:page"                     => "songs#index", as: "songs_page"
end
