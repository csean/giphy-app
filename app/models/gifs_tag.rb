class GifsTag < ApplicationRecord
  belongs_to :gif
  belongs_to :tag, counter_cache: :gifs_counter
end
