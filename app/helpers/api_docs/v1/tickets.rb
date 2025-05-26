# frozen_string_literal: true

# rubocop:disable Metrics/ModuleLength
module Docs
  def self.add_common_params(api)
    api.param :form, 'user[title]', :string, :required, 'Title'
    api.param :form, 'user[description]', :text, :optional, 'Description'
    api.param :form, 'user[status_id]', :integer, :required, 'Ticket Status'
    api.param :form, 'user[progress]', :integer, :required, 'Ticket Progress'
    api.param :form, 'user[due_date]', :date, :required, 'Due Date'
  end

  def self.create_params(api)
    api.summary 'Creating Ticket'
    api.notes 'This API creates ticket'
    api.param :form, 'user[user_id]', :integer, :required, 'User ID'
    Docs.add_common_params(api)

    api.response :ok
    api.response :unprocessable_entity
  end

  def self.update_params(api)
    api.summary 'Updating Ticket'
    api.notes 'This API updates ticket data'
    Docs.add_common_params(api)

    api.response :ok
    api.response :unprocessable_entity
    api.response :not_found
  end
end
# rubocop:enable Metrics/ModuleLength
