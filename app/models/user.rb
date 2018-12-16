class User < ApplicationRecord

	has_many :questions
	has_many :answers

	has_secure_password
	has_secure_token	
	after_initialize :init
	
	validates_presence_of :username, :password_digest, :screen_name, :email
	validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create
	

	validates :email, uniqueness: true
	validates :username, uniqueness: true


	def valid_token?
		now = DateTime.now.to_time
		ut = self.update_token.to_time
		((now - ut) / 1.minutes) < 30
	end

	def token_update
		  self.regenerate_token
	      self.update_token= DateTime.now
	      self.save
	end

	 def init
  		self.update_token = DateTime.now if self.update_token.nil?
 	 end

end
