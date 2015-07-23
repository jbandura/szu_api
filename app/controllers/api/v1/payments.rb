module API
  module V1
    class Payments < Grape::API 
      version 'v1'
      format :json
      formatter :json, Grape::Formatter::ActiveModelSerializers

      def permitted_params
        @permitted_params ||= declared(params, include_missing: false)
      end

      resource :payments do
        desc "Return list of students"
        params do 
          optional :paid, type: Boolean
        end
        get "", root: :payments do 
          return Payment.all if params[:paid].nil?
          Payment.where(paid: params[:paid])
        end

        desc "Modifiy payment"
        params do 
          requires :id, type:Integer
          requires :payment, type: Hash do 
            requires :paid, type: Boolean
          end
        end

        put ":id", root: :payment do 
          Payment.find(params[:id]).update!({
            paid: params[:payment][:paid]
          })
        end
      end
    end
  end
end
