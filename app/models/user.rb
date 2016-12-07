class User < ActiveRecord::Base
	@attrs = [:name, :role_id, :email, :id]

	attr_accessible *@attrs

	validates :name,  :presence => true 
	validates :email, :presence => true,
	          :format => { :with => EMAIL_REGEXP } ,
	          :uniqueness => {:case_sensitive => false }

	has_one :role

	def is_employee?
		role_id == Role::EMPLOYEE_ID
	end	

	def is_user?
		role_id == Role::USER_ID
	end

end

