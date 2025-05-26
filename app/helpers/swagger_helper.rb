# frozen_string_literal: true

# This class insured SwaggerDocs generates custom
# fields to each action on the documentation
module SwaggerHelper
  class << Api::V1::BaseApiController
    Swagger::Docs::Generator.set_real_methods

    def inherited(subclass)
      super
      subclass.class_eval do
        setup_basic_api_documentation
        setup_custom_api_documentation
      end
    end

    private

    # We can set custom params here to be generated on
    # each action eg: locales and app token
    #
    def setup_basic_api_documentation
      # %i[index show create update destroy].each do |api_action|
      #   swagger_api api_action do
      #     param :path, :locale, :string, :required, 'Locale \'en\' or \'ar\''
      #     param :header, 'X-APP-Token', :string, :required, 'App Authentication Token'
      #   end
      # end
    end

    # Same here if we have custom actions
    # This is to DRY the controllers as much as possible
    # when it comes to adding more API Docs
    #
    def setup_custom_api_documentation
      # SOMECLASS::CUSTOM_ACTIONS.map do |_model, actions|
      #   actions.map do |api_action|
      #     swagger_api api_action.to_sym do
      #       param :path, :locale, :string, :required, 'Locale \'en\' or \'ar\''
      #       param :header, 'X-APP-Token', :string, :required, 'App Authentication Token'
      #     end
      #   end
      # end
    end
  end
end
