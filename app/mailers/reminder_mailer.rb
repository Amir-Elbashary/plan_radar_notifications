class ReminderMailer < ApplicationMailer
  default from: 'notifications@planradar.com'

  def ticket_due_reminder(user, ticket)
    @user = user
    @ticket = ticket
    mail(to: @user.email, subject: "Reminder: #{@ticket.title}")
  end
end