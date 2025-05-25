class Api::V1::TestsController < Api::V1::BaseApiController
  require './app//helpers/api_docs/v1/tests'

  # API Documentation
  swagger_controller :tests, 'Test'

  ApplicationHelper.actions_for_controller(controller_path).each do |action|
    swagger_api action do |api|
      Docs.send("#{action}_params", api)
    end
  end

  def test
    render json: { message: 'Plan Radar' }, status: :ok
  end
end