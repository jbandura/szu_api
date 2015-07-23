class StudentSerializer < ActiveModel::Serializer
  attributes :id, :name, :surname, :city, :street, :country, :phone_nr, :accepted_terms, :student_group_id
  has_many :payments, embed: :ids, include: true
end
