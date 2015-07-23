module API
  module V1
    class StudentGroups < Grape::API 
      version 'v1'
      format :json
      formatter :json, Grape::Formatter::ActiveModelSerializers

      def permitted_params
        @permitted_params ||= declared(params, include_missing: false)
      end

      resource :student_groups do
        desc "Get all groups"
        get "", root: :student_groups do 
          StudentGroup.all
        end

        desc "Create new group"
        params do 
          requires :student_group, type: Hash do
            requires :name, type: String
          end
        end
        post "", root: :student_group do 
          StudentGroup.create({
            name: params[:student_group][:name]
          })
        end

        desc "Get a group"
        params do 
          requires :id, type: Integer
        end
        get ":id", root: "student_group" do
          StudentGroup.find(params[:id])
        end

        desc "Update a group"
        params do 
          requires :student_group, type: Hash do 
            requires :name, type: String
          end
        end
        put ":id", root: :student_group do 
          StudentGroup.find(params[:id]).update!({
            name: params[:student_group][:name]
          })
        end

        desc "Delete group"
        params do 
          requires :id, type: Integer
        end
        delete ':id' do 
          StudentGroup.find(params[:id]).destroy!
        end

        desc "Get all students for a group"
        params do
          requires :id, type: Integer
        end
        get ":id/students", root: :students do 
          StudentGroup.find(params[:id]).students
        end

      end
      
    end
  end
end
