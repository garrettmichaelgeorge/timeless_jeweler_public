FactoryBot.define do
  factory :gemstone_subcategory, class: 'Gemstone::Subcategory' do
    name { 'My Gemstone Subcategory' }
    gemstone_category { nil }
  end
end
