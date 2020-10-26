FactoryBot.define do
  factory :gemstone_subcategory, class: 'Gemstone::Subcategory' do
    name { "MyString" }
    gemstone_category { nil }
  end

  factory :gemstone_category, class: 'Gemstone::Category' do
    name { "MyString" }
  end

  factory :gemstone do
    gemstone_category { nil }
    carat { 3.05 }
  end

  factory :user do
    email { 'example@example.com' }
    password { 'pa$$word' }

    factory :invalid_user do
      email { 'example@example' }
    end
  end

  factory :product do
    name { 'Small ring' }
  end
end
