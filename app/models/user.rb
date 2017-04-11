class User < ApplicationRecord
	has_secure_password
	validates_uniqueness_of :email, presence: true #message: "You need to include an email"
	validates :first_name, :length => { :maximum => 30}# message: "your name is too long"
	validates :last_name, :length => {:maximum => 30}
	validates :country, :length => {:maximum => 30}
	validates :state, :length => {:maximum => 30}
	validates :city, :length => {:maximum => 30}
	validates :zip, :length => {:maximum => 6}

	
	#validates_length_of :phone_no, :minimum => 10, :maximum => 10
	#validates :password, format: {with: /\A(?=.*[a-z])(?=.*[A-Z])(?=.*\d)./, 
    #message: "must include at least one lowercase letter, one uppercase letter, and one digit"} 

	#mount_uploader :image, ImageUploader


def send_password_reset
  generate_token(:password_reset_token)
  self.password_reset_sent_at = Time.zone.now
  save!
  UserMailer.password_reset(self).deliver
end


def generate_token(column)
  begin
    self[column] = SecureRandom.urlsafe_base64
  end while User.exists?(column => self[column])
end 		



end
