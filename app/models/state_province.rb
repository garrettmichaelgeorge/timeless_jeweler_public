# == Schema Information
#
# Table name: state_provinces
#
#  id         :bigint           not null, primary key
#  code       :string(2)
#  name       :string(40)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class StateProvince < ApplicationRecord
end
