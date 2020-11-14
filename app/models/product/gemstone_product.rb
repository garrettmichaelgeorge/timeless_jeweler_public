# == Schema Information
#
# Table name: gemstone_products
#
#  gemstone_id         :bigint           not null
#  gemstone_profile_id :bigint           not null
#  product_id          :bigint           not null
#
# Indexes
#
#  index_gemstone_products_on_gemstone_id          (gemstone_id)
#  index_gemstone_products_on_gemstone_profile_id  (gemstone_profile_id)
#  index_gemstone_products_on_product_id           (product_id)
#
# Foreign Keys
#
#  fk_rails_...  (gemstone_profile_id => gemstone_profiles.id)
#  fk_rails_...  (product_id => products.id)
#

class Product
  class GemstoneProduct < ApplicationRecord
    # Subtype of Product. All meaningful attributes are in :profile
    self.table_name = 'gemstone_products'

    include Salable

    after_initialize :ensure_profile_exists

    # def initialize
    #   super
    #   build_profile if profile.nil?
    # end

    # Associations
    belongs_to :profile, class_name: 'Product::Gemstone::Profile',
                         foreign_key: 'gemstone_id',
                         inverse_of: :gemstone_product,
                         dependent: :destroy,
                         touch: true,
                         validate: true

    # Validations
    # validates_associated :profile

    # Delegations
    delegate_missing_to :profile
    # delegate :carat, to: :profile

    private

    def ensure_profile_exists
      build_profile if profile.nil?
    end
  end
end
