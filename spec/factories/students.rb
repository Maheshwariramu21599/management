FactoryBot.define do
  factory :student do
    first_name{ Faker::Name.first_name }
    last_name{ Faker::Name.last_name }
    #advisor_id{1}
    #room_id{2}
    #active true
  end
end
