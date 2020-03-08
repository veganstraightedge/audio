class Song < ApplicationRecord
  belongs_to :album
  has_many :quotes, dependent: :destroy
  default_scope { order('name ASC') }

  class << self
    def find_for_select
      @songs = Song.all
      sort_songs
      map_songs
    end
  end

  def pretty_name
    name.gsub(/^\d+\W/, '')
  end

  private

  def sort_songs
    @songs.sort_by { |song| song.album.band.name }
  end

  def map_songs
    @songs.map { |s| ["#{s.album.band.name} : #{s.album.name} : #{s.pretty_name}", s.id] }
  end
end
