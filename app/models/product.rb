# == Schema Information
#
# Table name: products
#
#  id                :bigint           not null, primary key
#  brand             :string(40)
#  cost              :decimal(10, 2)
#  description       :text
#  long_name         :string
#  misc_measurements :text
#  name              :string(40)
#  price             :decimal(10, 2)
#  short_name        :string
#  size              :decimal(7, 2)
#  size_unit         :string
#  weight            :decimal(7, 2)
#  weight_unit       :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
class Product < ApplicationRecord

end
