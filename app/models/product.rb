# == Schema Information
#
# Table name: products
#
#  id                    :bigint           not null, primary key
#  brand                 :string(40)
#  cost_cents            :integer          default(0), not null
#  cost_currency         :string           default("USD"), not null
#  description           :text
#  long_name             :string
#  misc_measurements     :text
#  name                  :string(40)
#  price_cents           :integer          default(0), not null
#  price_currency        :string           default("USD"), not null
#  short_name            :string
#  size                  :decimal(7, 2)
#  size_unit             :string
#  weight                :decimal(7, 2)
#  weight_unit           :string
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  product_categories_id :bigint
#
# Indexes
#
#  index_products_on_product_categories_id  (product_categories_id)
#
# Foreign Keys
#
#  fk_rails_...  (product_categories_id => product_categories.id)
#
class Product < ApplicationRecord

end
