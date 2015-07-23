class CourseSerializer < ActiveModel::Serializer
  attributes :id, :name, :weekday, :time, :student_group_id
end
