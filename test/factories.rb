FactoryBot.define do
  factory :user do
    email_address { 'example@example.com' }
    password { 'pa$$word' }

    factory :invalid_user do
      email_address { 'example@example' }
    end
  end

  factory :product do
    name { 'Small ring' }
  end
end
