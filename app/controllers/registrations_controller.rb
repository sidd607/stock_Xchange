class RegistrationsController < Devise::RegistrationsController

 def new
  @user = User.new
 end

  def create
    super
    session[:omniauth] = nil unless @user.new_record?
  end

 
  

  def edit
    super
  end 
 
 def cancel
    super
 end 

 def destroy
    super
 end 

 protected

 def update_resource(resource, params)
    if current_user.provider == "facebook"
      params.delete("current_password")
      resource.update_without_password(params)
    else
      resource.update_with_password(params)
    end
    if current_user.provider == "google_oauth2"
      params.delete("current_password")
      resource.update_without_password(params)
    else
      resource.update_with_password(params)
    end
 end
 

  #def update_resource(resource, params)
    #resource.update_without_password(params)
  #end
  private
 
  def build_resource(*args)
    super
    if session[:omniauth]
      @user.apply_omniauth(session[:omniauth])
      @user.valid?
    end
  end
end