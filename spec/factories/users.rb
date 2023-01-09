FactoryBot.define do
  factory :user do
    name { "Жора_#{rand(999)}" }
    sequence(:email) { |n| "jora_#{n}@example.com" }
    after(:build) { |u| u.password_confirmation = u.password = 'qwerty' }
  end
end
