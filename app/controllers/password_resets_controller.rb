class PasswordResetsController < ApplicationController
	def create
  user = User.find_by_email(params[:request][:email])
  if user.present?
  user.send_password_reset 
 render json: {responsecode:200, responsemessage:"Successfull" }
else
render json: {responsecode:400, responsemessage:"could not found" }
end
end
end
