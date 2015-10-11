module API
  module V1
    class PresenceLists < Grape::API
      version 'v1'
      format :json
      formatter :json, Grape::Formatter::ActiveModelSerializers

      def permitted_params
        @permitted_params ||= declared(params, include_missing: false)
      end

      resource :presence_lists do

        desc "Return presence lists"

        get "", root: :presence_lists do
          PresenceList.all
        end

        desc "Get a list"
        params do
          requires :id, type: Integer, desc: "List ID"
        end
        get ':id', root: :presence_list do
          PresenceList.find(params[:id])
        end

        desc "Create a presence list"

        params do
          requires :presence_list, type: Hash do
            requires :date, type: Date, desc: "Date"
            requires :course_id, type: Integer, desc: "Course ID"
          end
        end

        post nil, root: :presence_list do
          PresenceList.create!({
            date: params[:presence_list][:date],
            course_id: params[:presence_list][:course_id]
          })
        end

      end
    end
  end
end
