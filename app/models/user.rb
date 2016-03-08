class User < ActiveRecord::Base
	validates :name, presence: true

	VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
	validates :email, presence: true, 
										uniqueness: { case_sensitive: false},
										format: { with: VALID_EMAIL_REGEX }

	has_secure_password
end
