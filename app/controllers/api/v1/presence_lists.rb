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
          optional :id, type: Integer, desc: "List ID"
          optional :student, type: Integer, desc: "Student ID"
        end
        get ':id', root: :presence_list do
          return PresenceManager.all_for_student(params[:student]) unless params[:student].nil?
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

        desc "Update a presence list"

        params do
          requires :id, type: Integer, desc: "List ID"
          requires :presence_list, type: Hash do
            requires :date, type: Date, desc: "Date"
            requires :course_id, type: Integer, desc: "Course ID"
          end
        end

        put ':id' do
          PresenceList.find(params[:id]).update({
            date: params[:presence_list][:date],
            course_id: params[:presence_list][:course_id]
          });
        end

        desc "Delete a presence list"

        params do
          requires :id, type: Integer, desc: "List ID"
        end

        delete ':id' do
          PresenceList.find(params[:id]).destroy!
        end

      end
    end
  end
end
