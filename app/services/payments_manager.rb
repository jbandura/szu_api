class PaymentsManager

  def self.generate_current_month
    unless current_month_generated?
      student_ids = Student.all.pluck(:id)
      today = Date.today
      student_ids.each do |student_id|
        Payment.create!({
          student_id: student_id,
          month_nr: today.strftime("%m"),
          year_nr: today.strftime("%Y"),
          paid: 0
        })
      end
    end
  end

  def self.create_for_student(student_id)
    today = Date.today
    Payment.create!({
      student_id: student_id,
      month_nr: today.strftime("%m"),
      year_nr: today.strftime("%Y"),
      paid: false
    })
   end

  def self.current_month_generated?
    Payment.current_month_year.count > 0
  end

  def self.overdue_for_student(student_id)
    Payment.current_month_year.where(:paid => false)
                              .where(:student_id => student_id)
  end

end
