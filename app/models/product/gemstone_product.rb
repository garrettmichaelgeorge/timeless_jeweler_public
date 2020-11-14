# == Schema Information
#
# Table name: loose_gemstones
#
#  gemstone_id :bigint           not null
#  product_id  :bigint           not null
#
# Indexes
#
#  index_loose_gemstones_on_gemstone_id  (gemstone_id)
#  index_loose_gemstones_on_product_id   (product_id)
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
