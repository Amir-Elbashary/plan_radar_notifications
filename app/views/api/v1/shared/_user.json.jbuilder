# frozen_string_literal: true

json.extract! user,
              :id, :name, :email,
              :send_due_date_reminder, :due_date_reminder_interval,
              :due_date_reminder_time, :time_zone,
              :created_at, :updated_at
