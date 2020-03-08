class Quote < ApplicationRecord
  belongs_to :band
  belongs_to :song
end
