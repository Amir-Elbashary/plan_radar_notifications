class Api::V1::UsersController < Api::V1::BaseApiController
  require './app//helpers/api_docs/v1/users'
  before_action :set_user, only: :update

  # API Documentation
  swagger_controller :users, 'Users'

  ApplicationHelper.actions_for_controller(controller_path).each do |action|
    swagger_api action do |api|
      Docs.send("#{action}_params", api)
    end
  end

  def create
    @user = User.new(user_params)

    return if @user.save

    raise_validation_erorrs(@user)
  end

  def update
    return if @user.update(user_params)

    raise_validation_erorrs(@user)
  end

  private

  def user_params
    params.require(:user).permit(:name, :email,
                                 :send_due_date_reminder, :due_date_reminder_time,
                                 :due_date_reminder_interval, :time_zone)
  end

  def set_user
    @user = User.find(params[:id])
  end
end