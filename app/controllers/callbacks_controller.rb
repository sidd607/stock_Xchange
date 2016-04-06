class CallbacksController < Devise::OmniauthCallbacksController
  skip_before_filter :authenticate_user!
  def all
    omniauth = request.env["omniauth.auth"]
    authorization = Authorization.find_by_provider_and_uid(omniauth['provider'], omniauth['uid'])
    if authorization
      flash[:notice] = "Signed in successfully."
      sign_in_and_redirect(:user, authorization.user)
    elsif current_user
      current_user.authorizations.create!(:provider => omniauth['provider'], :uid => omniauth['uid'])
      flash[:notice] = "authorization successful."
      redirect_to authorizations_url
    else
      user = User.from_omniauth(env["omniauth.auth"], current_user)
     # user.apply_omniauth(omniauth)
      if user.persisted?
        flash[:notice] = "Signed in successfully."
        sign_in_and_redirect(:user, user)
      else
        session["devise.user_attributes"] = user.attributes
      redirect_to new_user_registration_url

      end
    end
     #if user.persisted?
      #flash[:notice] = "You are in..!!! Go to edit profile to see the status for the accounts"
      #sign_in_and_redirect(user)
    #else
      #session["devise.user_attributes"] = user.attributes
      #redirect_to new_user_registration_url
    #end
  end

  def failure
      #handle you logic here..
      #and delegate to super.
      super
  end
  alias_method :facebook, :all
  alias_method :google_oauth2, :all
end