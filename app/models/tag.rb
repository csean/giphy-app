class Tag < ApplicationRecord
  has_many :gifs_tags, dependent: :destroy
  has_many :gifs, through: :gifs_tags

  validates_presence_of :name

  before_create :clean_name

  private

  def clean_name
    self.name.gsub!(/[^a-zA-Z0-9 ]/, '')
  end
end
