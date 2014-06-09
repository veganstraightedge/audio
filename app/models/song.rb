class Song < ActiveRecord::Base
  belongs_to :album
  has_many :quotes, :dependent => :destroy
  default_scope { order("name ASC") }

  class << self
    def find_for_select
      Song.all.sort_by{ |s| s.album.band.name }.map{ |song| ["#{song.album.band.name} : #{song.album.name} : #{song.pretty_name}", song.id] }
    end
  end

  def pretty_name
    name.gsub(/^\d+\W/, "")
  end
end
