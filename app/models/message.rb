class Message < ActiveRecord::Base
	belongs_to :user

	attr_accessible :content, :user_id

	validates :content, :user_id , :presence => true

end

