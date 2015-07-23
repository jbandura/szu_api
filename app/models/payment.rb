class Payment < ActiveRecord::Base
	belongs_to :student

	scope :current_month_year, (lambda do 
		where(:month_nr => Date.today.strftime("%m")).where(:year_nr => Date.today.strftime("%Y"))
	end)
end
