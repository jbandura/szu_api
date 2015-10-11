class Presence < ActiveRecord::Base
  belongs_to :presence_list, dependent: :destroy
  belongs_to :student, dependent: :destroy

  has_many :presences, dependent: :destroy
end
