# == Schema Information
#
# Table name: metal_purities
#
#  id         :bigint           not null, primary key
#  value      :string(4)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_metal_purities_on_value  (value) UNIQUE
#
class Product::Jewelry::MetalPurity < ApplicationRecord
  def self.table_name
    'metal_purities'
  end
end
