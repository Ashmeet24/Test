class UsersController < ApplicationController
	def index
    @user=User.all
     render json: {:user => @user}
end
def edit
    @user=User.find(params[:id])
    end

def new
@user = User.new
end

def create
  user = User.new(user_params)

   if user.save
    #login[:user_id] = @user.id
    render json: {:user =>user,responsecode: 200, responsemessage: "User Created"}
  else
    render json: { responsecode: 400, responsemessage: "Bad Request"}
    end
end


 def show
   if @user = User.find_by(id: params[:request][:user_id])
    render json: {user: @user,responsecode: 200}
 else
       render json: {responsecode: 400, responsemessage: "Bad request"}
    end
  end


def home
user = User.find(params[:request][:user_id])

      if user.role.casecmp('king').zero?
      other =  User.where.not(role: "king")
        end

       if user.role.casecmp('queen').zero?
          other = User.where(role: 'girl')
      end

     if user.role.casecmp('boy').zero?
      other = User.where(role: 'king')
    
      end

     if user.role.casecmp('girl').zero?
         other = User.where(role: 'boy')
         end

      render json: {responsecode: 200, responsemessage: "home page" , home: other.as_json(only:[:id, :first_name, :last_name, :role])}


  end
def update
     
    user = User.find_by(id: params[:user][:id])

    return render json:{responsecode: 500, responsemessage: "User not found"} if user.blank?
 
    if user.update(update_params)
        render json: {responsecode: 200, responsemessage: "Profile Successfully updated"}
    else
       render json: {responsecode: 400, responsemessage: "Bad request"}
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
 
    redirect_to @user
  end
private

def home_params
    params.require(:user).permit(:id, :first_name, :last_name, :role)

end

def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :role)
  end
   
  def update_params
      params.require(:user).permit(:gender, :email, :street_name,:Kingdom_start_date,:Kingdom_today_date,:phone_no,:first_name,:last_name,:dob,:country,:address,:city,:kids,:state,:zip,:id)
end

end