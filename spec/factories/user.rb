FactoryBot.define do
  factory :user do
    name { Faker::Name.unique.name }
    email { Faker::Internet.unique.email }
    send_due_date_reminder { true }
    due_date_reminder_interval { 1 }
    due_date_reminder_time { Time.now }
  end
end
