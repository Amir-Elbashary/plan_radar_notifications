# frozen_string_literal: true

# rubocop:disable Metrics/ModuleLength
module Docs
  def self.add_common_params(api)
    api.param :form, 'user[name]', :string, :required, 'User name'
    api.param :form, 'user[email]', :string, :required, 'User Email'
  end

  def self.create_params(api)
    api.summary 'Test API'
    api.notes 'This API creates user'
    Docs.add_common_params(api)

    api.response :ok
    api.response :unprocessable_entity
  end

  def self.update_params(api)
    api.summary 'Updating User'
    api.notes 'This API updates user info'
    Docs.add_common_params(api)
    api.param_list :form, 'user[send_due_date_reminder]', :boolean,
                   :required, 'Send Reminder', %i[true false]
    api.param :form, 'user[due_date_reminder_interval]', :integer, :required, 'Interval in Days'
    api.param :form, 'user[due_date_reminder_time]', :time, :optional, 'Reminder Time'
    api.param :form, 'user[time_zeon]', :string, :optional, 'Time Zone'

    api.response :ok
    api.response :unprocessable_entity
    api.response :not_found
  end
end
# rubocop:enable Metrics/ModuleLength
