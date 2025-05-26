FactoryBot.define do
  factory :ticket do
    title { Faker::Name.unique.name }
    description { Faker::Name.name }
    status_id { 1 }
    progress { 1 }
    due_date { (Time.now + 2.minutes) }
    user
  end
end
