# == Schema Information
#
# Table name: sources
#
#  id         :bigint           not null, primary key
#  code       :string(1)        not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Product::Source < ApplicationRecord
end
