# frozen_string_literal: true

class ValidationErrors
  attr_reader :object, :identifier, :status

  def initialize(object, identifier, status)
    @object = object
    @identifier = identifier
    @status = status
  end


  def as_json(*)
    {
      status: Rack::Utils.status_code(status),
      code: identifier,
      title: translated_payload[:title],
      details: object.errors.full_messages
    }
  end

  def translated_payload
    I18n.translate("errors.#{identifier}")
  end
end
