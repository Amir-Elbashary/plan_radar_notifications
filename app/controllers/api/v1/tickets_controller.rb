class Api::V1::TicketsController < Api::V1::BaseApiController
  require './app//helpers/api_docs/v1/tickets'
  before_action :set_ticket, only: :update

  # API Documentation
  swagger_controller :tickets, 'Tickets'

  ApplicationHelper.actions_for_controller(controller_path).each do |action|
    swagger_api action do |api|
      Docs.send("#{action}_params", api)
    end
  end

  def create
    @ticket = Ticket.new(ticket_params)

    return if @ticket.save

    raise_validation_erorrs(@ticket)
  end

  def update
    return if @ticket.update(ticket_params)

    raise_validation_erorrs(@ticket)
  end

  private

  def ticket_params
    params.require(:ticket).permit(:user_id, :title, :description,
                                 :status_id, :progress, :due_date)
  end

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end
end