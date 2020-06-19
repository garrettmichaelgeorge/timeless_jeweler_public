# == Schema Information
#
# Table name: products
#
#  id                  :bigint           not null, primary key
#  acquired_on         :date
#  brand               :string(40)
#  clarity             :string
#  color               :string
#  cost_cents          :integer          default(0), not null
#  cost_currency       :string           default("USD"), not null
#  description         :text
#  long_name           :string(255)
#  metal               :string
#  misc_measurements   :text
#  price_cents         :integer          default(0), not null
#  price_currency      :string           default("USD"), not null
#  purity              :string
#  report_number       :string
#  short_name          :string(40)
#  size                :decimal(7, 2)
#  size_unit           :string
#  weight              :decimal(7, 2)
#  weight_unit         :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  product_category_id :bigint           not null
#
# Indexes
#
#  index_products_on_product_category_id  (product_category_id)
#
# Foreign Keys
#
#  fk_rails_...  (product_category_id => product_categories.id)
#
class Product < ApplicationRecord
  monetize :price_cents
  monetize :cost_cents
  has_many :store_transaction_line_items
  belongs_to :category, class_name: "ProductCategory",
                        inverse_of: :products,
                        foreign_key: "product_category_id"

  def to_label
    "#{self.name} (#{self.price})"
  end

  delegate :name, to: :category, prefix: true

  alias_attribute :name, :short_name
end
