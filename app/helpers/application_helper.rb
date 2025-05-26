# frozen_string_literal: true

module ApplicationHelper
  # This method allow SwaggerDocs to access all
  # actions to generate docs for it
  def self.actions_for_controller(controller_path)
    route_defaults = Rails.application.routes.routes.map(&:defaults)
    route_defaults = route_defaults.select { |x| x[:controller] == controller_path }
    route_defaults.map { |x| x[:action].to_sym }.uniq
  end
end
