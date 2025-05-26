class ReminderMailer < ApplicationMailer
  default from: 'notifications@planradar.com'

  def ticket_due_reminder(user, tickets)
    @user = user
    @tickets = tickets
    mail(to: @user.email, subject: "Reminder: You have tickets due soon")
  end
end