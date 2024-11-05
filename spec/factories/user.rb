FactoryBot.define do
  factory(:user) do
    name { Faker::Internet.email }
    address { Faker::Internet.password }
  end
end
