module API
  module V1
    class Presences < Grape::API
      version 'v1'
      format :json
      formatter :json, Grape::Formatter::ActiveModelSerializers

      def permitted_params
        @permitted_params ||= declared(params, include_missing: false)
      end

      resource :presences do

        desc "Add a presence"

        params do
          requires :presence, type: Hash do
            requires :presence_list_id, type: Integer, desc: "Presence list ID"
            requires :student_id, type: Integer, desc: "Student ID"
            requires :is_present, type: Boolean, desc: "Was this user present?"
          end
        end

        post nil, root: :presence do
          Presence.create!({
            presence_list_id: params[:presence][:presence_list_id],
            student_id: params[:presence][:student_id],
            is_present: params[:presence][:is_present],
          })
        end

        desc "Get all presences for given list"

        params do
          requires :list_id, type: Integer
        end

        get nil, root: :presence do
          Presence.where(presence_list_id: params[:list_id])
        end
      end
    end
  end
end
