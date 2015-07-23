class Student < ActiveRecord::Base
  has_many :payments, dependent: :destroy
end
