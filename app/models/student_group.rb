class StudentGroup < ActiveRecord::Base
  has_many :students, dependent: :destroy
end
