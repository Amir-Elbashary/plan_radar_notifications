# frozen_string_literal: true

# rubocop:disable Metrics/ModuleLength
module Docs
  def self.test_params(api)
    api.summary 'Test API'
    api.notes 'This API tests Swagger Docs'

    api.response :ok
  end
end
# rubocop:enable Metrics/ModuleLength
