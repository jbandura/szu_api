class PaymentSerializer < ActiveModel::Serializer
  attributes :id, :student_id, :month_nr, :year_nr, :paid
end
