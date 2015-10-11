class PresenceSerializer < ActiveModel::Serializer
  attributes :id, :student_id, :presence_list_id, :is_present
end
