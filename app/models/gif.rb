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

  has_many :gifs_tags, dependent: :destroy
  has_many :tags, through: :gifs_tags

  paginates_per 20

  validates_presence_of :giphy_id

  def to_param
    giphy_id
  end

  def associate_tags(tag_params)
    tags.clear
    tag_params.each do |tag|
      next if tag.blank?

      if tag == tag.to_i.to_s
        GifsTag.create(gif_id: id, tag_id: tag.to_i)
      else
        tags << Tag.find_or_create_by(name: tag.downcase)
      end
    end
  end

end
