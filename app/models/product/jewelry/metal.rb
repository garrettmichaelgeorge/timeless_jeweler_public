# == Schema Information
#
# Table name: metals
#
#  id         :bigint           not null, primary key
#  name       :string(40)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_metals_on_name  (name) UNIQUE
#
class Product::Jewelry::Metal < ApplicationRecord
  def self.table_name
    'metals'
  end
end
