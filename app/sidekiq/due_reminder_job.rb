class DueReminderJob
  include Sidekiq::Job
  sidekiq_options queue: :default

  def perform
    User.where(send_due_date_reminder: true).find_each do |user|
      Time.use_zone(user.time_zone) do
        # Defining the current time in user's timezone
        now = Time.zone.now
        # Setting the time based on how many days user set his/her interval
        due_date = now.to_date + user.due_date_reminder_interval.days
        
        # Skip if the time doesn't match
        next unless now.strftime('%H:%M') == user.due_date_reminder_time.strftime('%H:%M')

        # Query the tickets that matches the due date
        # and also which doesn't have progress (Assuming it's the flag)
        tickets = user.tickets.where(due_date: due_date, progress: 0)
        
        next if tickets.empty?

        # Send reminder
        tickets.each do |ticket|
          ReminderMailer.ticket_due_reminder(user, ticket).deliver_now
          # Updating progress to 1 to mark as complete
          # It should be considered to update after confirming
          # the email is delivered or not
          ticket.update(progress: 1)
        end
      end
    end
  end
end
