class PresenceManager

  def self.all_for_student(student_id)
    list_ids = Presence.where(student_id: student_id).pluck(:presence_list_id)
    PresenceList.find(list_ids)
  end

end
