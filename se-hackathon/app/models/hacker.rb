class Hacker < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  devise :omniauthable, :omniauth_providers => [:github]

  # Setup accessible (or protected) attributes for your model
  attr_accessible :username, :name, :email, :password, :password_confirmation,
                  :remember_me, :provider, :uid
  # attr_accessible :title, :body

  def self.find_or_create_for_github_oauth(auth, signed_in_resource = nil)
    hacker = Hacker.where(:provider => auth.provider, :uid => auth.uid).first
    unless hacker
      hacker = Hacker.create(name: auth.info.name,
                             username: auth.info.nickname,
                             provider: auth.provider,
                             uid: auth.uid,
                             email: auth.info.email,
                             password: Devise.friendly_token[0,20])
    end
    hacker
  end

end
