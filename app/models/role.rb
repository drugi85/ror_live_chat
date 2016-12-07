class Role < ActiveRecord::Base
	EMPLOYEE_ID = 1
	USER_ID = 2

	belongs_to :user

	attr_accessible :name

	validates :name , :presence => true
end
