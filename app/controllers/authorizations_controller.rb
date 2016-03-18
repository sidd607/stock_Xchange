class AuthorizationsController < ApplicationController


def index
   @authorizations = current_user.authorizations if current_user
end
 
 def create
   omniauth = request.env["omniauth.auth"]
   authorization = Authorization.find_by_provider_and_uid(omniauth['provider'], omniauth['uid'])
   if authorization
     flash[:notice] = "Signed in successfully."
     sign_in_and_redirect(:user, authorization.user)
   elsif current_user
     current_user.authorizations.create!(:provider => omniauth['provider'], :uid => omniauth['uid'])
     flash[:notice] = "Authorization successful."
     redirect_to authorizations_url
   else
     user = User.new
     user.apply_omniauth(omniauth)
     if user.save
       flash[:notice] = "Signed in successfully."
       sign_in_and_redirect(:user, user)
     else
       session[:omniauth] = omniauth.except('extra')
       redirect_to new_user_registration_url
     end
   end
 end
 
 def destroy
   @authorization = current_user.authorizations.find(params[:id])
   @authorization.destroy
   flash[:notice] = "Successfully destroyed authorization."
   redirect_to authorizations_url
 end
end


