FactoryBot.define do
  factory :email_address do
    for_person
    email_address { Faker::Internet.unique.email }

    trait :for_person do
      association :emailable, factory: :person
    end
  end

  factory :gemstone_category, class: 'Gemstone::Category' do
    sequence(:name) { |n| "Ruby #{n}" }

    trait :diamond do
      sequence(:name) { |n| "Diamond #{n}" }
    end
  end

  factory :gemstone_report, class: 'Gemstone::Report' do
    report_no { '60338' }
    file_url { 'http://example.com' }
    gemstone
  end

  factory :gemstone, class: 'Gemstone::Listed' do
    carat { rand(100.0..1000.0) / 10 }
    category factory: :gemstone_category

    factory :listed_gemstone, class: 'Gemstone::Listed' do
    end

    factory :mounted_gemstone, class: 'Gemstone::Mounted' do
    end
  end

  factory :item_ownership_status, aliases: [:ownership_status], class: 'Item::OwnershipStatus' do
    transient { class_name { 'Item::OwnershipStatus' } }

    name { 'Consigned' }
    code { 'C' }

    initialize_with do
      class_name.constantize
                .where(name: name)
                .first_or_initialize(attributes)
    end
  end

  factory :item_style, aliases: [:art_deco] do
    transient { class_name { 'ItemStyle' } }

    name { 'Art Deco' }

    initialize_with do
      class_name.constantize
                .where(name: name)
                .first_or_initialize(attributes)
    end
  end

  factory :item, aliases: [:miscellaneous_item] do
    name { Faker::Commerce.unique.product_name }
    description { Faker::Lorem.paragraph(sentence_count: 1, random_sentences_to_add: 3) }
    style factory: :item_style
    ownership_status factory: :item_ownership_status
    acquired_at { Time.now }
    user
  end

  factory :loose_gemstone do
    name { Faker::Commerce.unique.product_name }
    description { Faker::Lorem.paragraph(sentence_count: 1, random_sentences_to_add: 3) }
    style factory: :item_style
    ownership_status factory: :item_ownership_status
    acquired_at { Time.now }
    user
  end

  factory :loose_gemstone_profile, class: 'LooseGemstone::Profile' do
    loose_gemstone
    gemstone
  end

  factory :merchant do
    sequence(:name) { |n| "Merchant #{n}" }
  end

  factory :metal_category, aliases: [:gold] do
    name { 'Gold' }
    initialize_with do
      MetalCategory.where(name: name)
                   .first_or_initialize(attributes)
    end
  end

  factory :metal_color, aliases: [:white] do
    name { 'White' }
    initialize_with do
      MetalColor.where(name: name)
                .first_or_initialize(attributes)
    end
  end

  factory :metal_purity do
    name { '14K' }
    initialize_with do
      MetalPurity.where(name: name)
                 .first_or_initialize(attributes)
    end
  end

  factory :metal do
    piece    factory: :piece_profile
    color    factory: :metal_color
    purity   factory: :metal_purity
    category factory: :metal_category
  end

  factory :mounting do
    piece factory: :piece_profile
    association :gemstone, factory: :mounted_gemstone
  end

  factory :person do
    first_name { 'John' }
    last_name { 'Smith' }
  end

  factory :piece_profile, class: 'Piece::Profile' do
    piece
    piece_subcategory
  end

  factory :piece_subcategory, class: 'Piece::Subcategory' do
    name { 'Ring' }
    code { 'R' }

    initialize_with do
      Piece::Subcategory.where(name: name)
                        .first_or_initialize(attributes)
    end
  end

  factory :piece do
    name { Faker::Commerce.unique.product_name }
    description { 'Lorem ipsum sic dolor amet.' }
    style factory: :item_style
    ownership_status factory: :item_ownership_status
    acquired_at { Time.now }
    user
  end

  factory :user do
    email { Faker::Internet.unique.email }
    password { 'pa$$word' }
    password_confirmation { 'pa$$word' }

    factory :clerk, class: 'Clerk' do
    end

    factory :admin, class: 'Admin' do
    end
  end
end
