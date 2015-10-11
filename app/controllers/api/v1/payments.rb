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
        desc "Return list of payments"
        params do
          optional :paid, type: Boolean
          optional :overdue, type: Boolean
        end
        get "", root: :payments do
          if params[:overdue]
            month_nr = Date.today.strftime("%m")
            year_nr = Date.today.strftime("%Y")
            return Payment.where(
              "paid = ? AND NOT (month_nr = ? AND year_nr = ?)",
              false,
              month_nr,
              year_nr
            )
          end
          return Payment.where(paid: params[:paid]) if params[:paid]
          return Payment.all
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
