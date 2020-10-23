FactoryBot.define do
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
