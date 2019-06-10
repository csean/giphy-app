# == Schema Information
#
# Table name: gifs
#
#  id          :bigint           not null, primary key
#  giphy_id    :string           not null
#  users_cache :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Gif < ApplicationRecord
  has_many :favorites, dependent: :destroy
  has_many :users, through: :favorites

  paginates_per 20

  validates_presence_of :giphy_id
end
