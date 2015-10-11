class Student < ActiveRecord::Base
  has_many :payments, dependent: :destroy
  has_many :presences, dependent: :destroy
  belongs_to :student_group  
end
