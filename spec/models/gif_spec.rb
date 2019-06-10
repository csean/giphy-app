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

require 'rails_helper'

describe Gif do
  context 'validations' do
    it { is_expected_to.validates_presence_of(:giphy_id) }
  end
end
