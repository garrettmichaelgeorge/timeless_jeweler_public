# == Schema Information
#
# Table name: gemstone_products
#
#  id                  :bigint           not null, primary key
#  gemstone_profile_id :bigint           not null
#  product_id          :bigint           not null
#
# Indexes
#
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

    # include Salable

    before_create :build_default_profile

    # Associations
    belongs_to :profile, class_name: 'Product::Gemstone::Profile',
                         foreign_key: 'gemstone_profile_id',
                         inverse_of: :gemstone_product,
                         dependent: :destroy,
                         touch: true

    accepts_nested_attributes_for :profile, update_only: true

    belongs_to :product, -> { gemstone },
               inverse_of: :gemstone_product

    # Validations
    # validates_associated :profile

    def profile
      # https://stackoverflow.com/questions/3808782/rails-best-practice-how-to-create-dependent-has-one-relations
      super || build_profile
    end

    # Delegations
    delegate_missing_to :profile
    # delegate :carat, :carat=, to: :profile

    private

    def build_default_profile
      build_profile if profile.nil?
      true
    end

    def build_associations
      profile || true
    end
  end
end
