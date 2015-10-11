class StudentSerializer < ActiveModel::Serializer
  attributes :id, :name, :surname, :city, :street, :country, :phone_nr, :accepted_terms
  has_many :payments, embed: :ids, include: true
  has_one :student_group, embed: :ids, embed_in_root: true
end
