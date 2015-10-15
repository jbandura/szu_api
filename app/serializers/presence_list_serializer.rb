class PresenceListSerializer < ActiveModel::Serializer
  attributes :id, :date, :course_id
  has_many :presences, embed: :ids, embed_in_root: true

end
