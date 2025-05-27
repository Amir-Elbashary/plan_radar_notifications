require 'rails_helper'
require 'sidekiq/testing'

Sidekiq::Testing.fake! # Ensures we can test enqueuing

RSpec.describe DueReminderJob, type: :job do
  let(:now) { Time.zone.local(2025, 5, 25, 8, 0, 0) }

  before do
    Timecop.freeze(now)
    ActionMailer::Base.deliveries.clear
  end

  after { Timecop.return }

  let!(:user) {
    create(:user,
           send_due_date_reminder: true,
           due_date_reminder_time: Time.now.in_time_zone('Europe/Vienna'),
           due_date_reminder_interval: 1,
           time_zone: "Europe/Vienna")
  }

  let!(:ticket) {
    create(:ticket, due_date: Date.tomorrow, user: user)
  }

  it 'enqueues the job' do
    expect {
      DueReminderJob.perform_async
    }.to change(DueReminderJob.jobs, :size).by(1)
  end

  it 'executes and sends reminder email' do
    expect(Ticket.first.progress).to eq(0)

    Sidekiq::Testing.inline!
    expect {
      DueReminderJob.new.perform
    }.to change { ActionMailer::Base.deliveries.count }.by(1)

    expect(Ticket.first.progress).to eq(1)
  end

  it 'does not send email if time does not match' do
    user.update(due_date_reminder_time: now + 2.hour)
    Sidekiq::Testing.inline!
    expect {
      DueReminderJob.new.perform
    }.not_to change { ActionMailer::Base.deliveries.count }
  end

  it 'does not send email if no due ticket' do
    ticket.update(due_date: Date.today + 5.days)
    Sidekiq::Testing.inline!
    expect {
      DueReminderJob.new.perform
    }.not_to change { ActionMailer::Base.deliveries.count }
  end
end

