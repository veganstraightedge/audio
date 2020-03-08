class Band < ApplicationRecord
  has_many :albums, dependent: :destroy
  has_many :quotes, dependent: :destroy

  class << self
    def find_for_select
      Band.all.map { |band| [band.name, band.id] }
    end
  end
end
