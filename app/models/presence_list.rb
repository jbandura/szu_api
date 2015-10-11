class PresenceList < ActiveRecord::Base
  belongs_to :course
  has_many :presences, dependent: :destroy
end
