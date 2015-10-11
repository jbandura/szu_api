class Presence < ActiveRecord::Base
  belongs_to :presence_list
  belongs_to :student

end
