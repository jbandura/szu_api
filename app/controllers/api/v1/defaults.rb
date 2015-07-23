module API
  module V1
    module Defaults
      extend ActiveSupport::Concern

      included do

        prefix "api"
        version "v1", using: :path
        default_format :json
        format :json
        formatter :json, Grape::Formatter::ActiveModelSerializers

        def permitted_params
          @permitted_params ||= declared(params, include_missing: false)
        end
      end
    end
  end
end
