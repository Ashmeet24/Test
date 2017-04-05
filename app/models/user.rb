class User < ApplicationRecord
	has_secure_password
	validates_uniqueness_of :email

	#validates :password, format: {with: /\A(?=.*[a-z])(?=.*[A-Z])(?=.*\d)./, 
    #message: "must include at least one lowercase letter, one uppercase letter, and one digit"} 

	#mount_uploader :image, ImageUploader




end
