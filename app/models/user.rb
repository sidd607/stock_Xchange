class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,:recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook, :google_oauth2] 
  validates_presence_of :email
 
  has_many :authorizations
   validates_presence_of :name
     belongs_to :college
     has_many :transactions
     has_many :portfolios

  # Add the following methods
def apply_omniauth(omniauth)
  authorizations.build(:provider => omniauth['provider'], :uid => omniauth['uid'])
end
 
def password_required?
  if id
    (authorizations.empty? || !password.blank?) && super
  end
end

def oauth_user?
  authorizations.present?
end
 
def existing_auth_providers
  ps = self.authorizations.all
 
  if ps.size > 0
    return ps.map(&:provider)
  else
    return []
  end
end

def self.new_with_session(params,session)
    if session["devise.user_attributes"]
      new(session["devise.user_attributes"],without_protection: true) do |user|
        user.attributes = params
        user.valid?
      end
    else
      super
    end
end

 def update_with_password(params={})
    if params[:password].blank?
      params.delete(:current_password)
      self.update_without_password(params)
    else
      self.verify_password_and_update(params)
    end
 end

  def update_without_password(params={})

    params.delete(:password)
    params.delete(:password_confirmation)
    result = update_attributes(params)
    clean_up_passwords
    result
  end
  def verify_password_and_update(params)
    #devises' update_with_password 
    # https://github.com/plataformatec/devise/blob/master/lib/devise/models/database_authenticatable.rb
    current_password = params.delete(:current_password)

    if params[:password].blank?
      params.delete(:password)
      params.delete(:password_confirmation) if params[:password_confirmation].blank?
    end

    result = if valid_password?(current_password)
      update_attributes(params)
    else
      self.attributes = params
      self.valid?
      self.errors.add(:current_password, current_password.blank? ? :blank : :invalid)
      false
    end

    clean_up_passwords
    result
  end

  def self.from_omniauth(auth, current_user)
    authorization = Authorization.where(:provider => auth.provider, :uid => auth.uid.to_s, :token => auth.credentials.token, :secret => auth.credentials.secret).first_or_initialize
    if authorization.user.blank?
      user = current_user || User.where('email = ?', auth["info"]["email"]).first
      if user.blank?
       user = User.new
       user.password = Devise.friendly_token[0,10]
       user.name = auth.info.name
       user.email = auth.info.email
       user.image = auth.info.image
       if auth.provider == "twitter" 
         user.save(:validate => false) 
       else
         user.save
       end
      end
     
     authorization.user_id = user.id
     authorization.save
    end
   authorization.user
  end
end



 
