# == Schema Information
#
# Table name: metal_colors
#
#  id         :bigint           not null, primary key
#  name       :string(10)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_metal_colors_on_name  (name) UNIQUE
#
FactoryBot.define do
  factory :metal_color, aliases: [:white],
                        class: 'Product::Jewelry::MetalColor' do
    name { 'White' }
  end
end
