module API
  module V1
    class Courses < Grape::API
      version 'v1'
      format :json
      formatter :json, Grape::Formatter::ActiveModelSerializers

      def permitted_params
        @permitted_params ||= declared(params, include_missing: false)
      end

      resource :courses do
        desc "Get all courses"
        get "", root: :courses do
          Course.all
        end

        desc "Create a new course"
        params do
          requires :course, type: Hash do
            requires :name, type: String, desc: "Course name"
            requires :weekday, type: String, desc: "Course day"
            requires :time, type: String, desc: "Course time"
            requires :student_group_id, type: String, desc: "Course group id"
          end
        end
        post "", root: :course do
          Course.create!({
            name: params[:course][:name],
            weekday: params[:course][:weekday],
            time: params[:course][:time],
            student_group_id: params[:course][:student_group_id]
          })
        end

        desc "Get a course data"
        params do
          requires :id, type: Integer, desc: "Course ID"
        end
        get ":id", root: :course do
          Course.find(params[:id])
        end

        desc "Modify a course"
        params do
          requires :id, type: Integer, desc: "Course ID"
          requires :course, type: Hash do
            requires :name, type: String, desc: "Course name"
            requires :weekday, type: String, desc: "Course day"
            requires :time, type: String, desc: "Course time"
            requires :student_group_id, type: String, desc: "Course group id"
          end
        end
        put ":id", root: :course do
          Course.find(params[:id]).update!({
            name: params[:course][:name],
            weekday: params[:course][:weekday],
            time: params[:course][:time],
            student_group_id: params[:course][:student_group_id]
          })
        end

        desc "Delete a course"
        params do
          requires :id, type: Integer, desc: "Course ID"
        end
        delete ":id", root: :course do
          Course.find(params[:id]).destroy!
        end
      end
    end
  end
end
