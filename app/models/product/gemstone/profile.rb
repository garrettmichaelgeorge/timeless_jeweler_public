# == Schema Information
#
# Table name: gemstone_profiles
#
#  id         :bigint           not null, primary key
#  carat      :decimal(5, 2)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Product
  class Gemstone
    class Profile < ApplicationRecord
      self.table_name = 'gemstone_profiles'

      # Associations
      has_one :mounted_gemstone, class_name: 'Product::Gemstone::MountedGemstone',
                                 inverse_of: :profile,
                                 foreign_key: 'gemstone_profile_id'

      has_one :gemstone_product, class_name: 'Product::GemstoneProduct',
                                 inverse_of: :profile,
                                 foreign_key: 'gemstone_profile_id'

      # Validations
      validates_numericality_of :carat
    end
  end
end
