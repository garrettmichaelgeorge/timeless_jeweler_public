# == Schema Information
#
# Table name: metals
#
#  id                :bigint           not null, primary key
#  name              :string(40)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  metal_category_id :bigint           not null
#  metal_color_id    :bigint           not null
#  metal_purity_id   :bigint           not null
#  piece_id          :bigint           not null
#
# Indexes
#
#  index_metals_on_metal_category_id  (metal_category_id)
#  index_metals_on_metal_color_id     (metal_color_id)
#  index_metals_on_metal_purity_id    (metal_purity_id)
#  index_metals_on_name               (name) UNIQUE
#  index_metals_on_piece_id           (piece_id)
#
# Foreign Keys
#
#  fk_rails_...  (metal_category_id => metal_categories.id)
#  fk_rails_...  (metal_color_id => metal_colors.id)
#  fk_rails_...  (metal_purity_id => metal_purities.id)
#  fk_rails_...  (piece_id => pieces.id)
#

require 'test_helper'

class MetalTest < ActiveSupport::TestCase
  context 'associations' do
    should belong_to(:piece).inverse_of(:metals)
    should belong_to(:category).inverse_of(:metals)
    should belong_to(:color).inverse_of(:metals)
    should belong_to(:purity).inverse_of(:metals)
  end

  context 'delegations' do
    should delegate_method(:name).to(:category).with_prefix
    should delegate_method(:name).to(:color).with_prefix
    should delegate_method(:value).to(:purity).with_prefix
  end
end
