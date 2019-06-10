# == Schema Information
#
# Table name: users_gifs
#
#  user_id :bigint           not null
#  gif_id  :bigint           not null
#

class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :gif, counter_cache: :users_count

  def self.toggle_favorite(user, gif)
    join = find_by(user_id: user.id, gif_id: gif.id)
    if join
      join.destroy!
    else
      create!(user_id: user.id, gif_id: gif.id)
    end
  end
end
