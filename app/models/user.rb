class User < ActiveRecord::Base
	validates :name, presence: true

	VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
	validates :email, presence: true, 
										uniqueness: true,
										format: { with: VALID_EMAIL_REGEX, message: 'Invalid email address!' }

	has_secure_password
end
