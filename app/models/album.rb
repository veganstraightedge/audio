class Album < ActiveRecord::Base
  belongs_to :band
  has_many :songs, :dependent => :destroy

  class << self
    def find_for_select
      Album.all.map{ |album| ["#{album.band.name} : #{album.name}", album.id] }
    end
  end
end
