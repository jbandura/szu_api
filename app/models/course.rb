class Course < ActiveRecord::Base
  belongs_to :student_group
  has_many :presence_lists, dependent: :destroy
end
