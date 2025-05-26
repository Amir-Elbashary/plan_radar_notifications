class ApplicationController < ActionController::API
  include Swagger::Docs::Methods

  private

  def raise_validation_erorrs(object, identifier: :validation_failed, status: :unprocessable_entity)
    render json: ValidationErrors.new(object, identifier, status), status: status
  end
end
