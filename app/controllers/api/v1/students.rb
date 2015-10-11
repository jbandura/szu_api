module API
  module V1
    class Students < Grape::API
      version 'v1'
      format :json
      formatter :json, Grape::Formatter::ActiveModelSerializers

      def permitted_params
        @permitted_params ||= declared(params, include_missing: false)
      end

      resource :students do
        desc "Return list of students"

        get "", root: :students do
          Student.all
        end

        desc "Create a student"

        params do
          requires :student, type: Hash do
            requires :name, type: String, desc: "Student name"
            requires :surname, type: String, desc: "Student surname"
            requires :street, type: String, desc: "Student street"
            requires :city, type: String, desc: "Student city"
            requires :country, type: String, desc: "Student country"
            requires :phone_nr, type: String, desc: "Student phone_nr"
            requires :student_group_id, type: Integer, desc: "Student group"
          end
        end

        post nil, root: :student do
          student = Student.create!({
            name: params[:student][:name],
            surname: params[:student][:surname],
            street: params[:student][:street],
            city: params[:student][:city],
            country: params[:student][:country],
            phone_nr: params[:student][:phone_nr],
            student_group_id: params[:student][:student_group_id]
          })
          PaymentsManager.create_for_student(student.id)
        end

        desc "Get a student"
        params do
          requires :id, type: Integer, desc: "Student ID"
        end
        get ':id', root: :student do
          Student.find(params[:id])
        end

        desc "Update a student"
        params do
          requires :id, type: Integer
          requires :student, type: Hash do
            requires :name, type: String, desc: "Student name"
            requires :surname, type: String, desc: "Student surname"
            requires :street, type: String, desc: "Student street"
            requires :city, type: String, desc: "Student city"
            requires :country, type: String, desc: "Student country"
            requires :phone_nr, type: String, desc: "Student phone_nr"
            requires :student_group_id, type: String, desc: "Group ID"
            optional :accepted_terms, type: Boolean
          end
        end
        put ':id' do
          student = Student.find(params[:id])
          update = student.update({
            name: params[:student][:name],
            surname: params[:student][:surname],
            street: params[:student][:street],
            city: params[:student][:city],
            country: params[:student][:country],
            phone_nr: params[:student][:phone_nr],
            student_group_id: params[:student][:student_group_id],
            accepted_terms: params[:student][:accepted_terms]
          })
          update ? student : false
        end

        desc "Delete a student"
        params do
          requires :id, type: Integer
        end
        delete ':id' do
          Student.find(params[:id]).destroy!
        end

        desc "Get overdue payments for student"
        params do
          requires :id, type: Integer
          optional :paid, type: Boolean
        end
        get ':id/payments', root: :payments do
          return Payment.where(:student_id => params[:id]) if params[:paid].nil?
          Payment.where(:student_id => params[:id]).where(:paid => params[:paid])
        end

      end
    end
  end
end
