class Hacker < ActiveRecord::Base
  has_many :claims
  has_many :claimed_tasks, :through => :claims, :source => :task

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  devise :omniauthable, :omniauth_providers => [:github]

  # Setup accessible (or protected) attributes for your model
  attr_accessible :username, :name, :email, :password, :password_confirmation,
                  :remember_me, :provider, :uid, :github_token,
                  :as => [:default, :admin]

  has_and_belongs_to_many :hackathons

  def self.find_or_create_for_github_oauth(auth, signed_in_resource = nil)
    hacker = Hacker.where(:provider => auth.provider, :uid => auth.uid).first

    if hacker
      # FIXME does the token actually expire?
      # FIXME set this and let it be committed to DB with the rest of the devise
      #       fields
      hacker.update_attributes(github_token: auth.credentials.token)
    else
      hacker = Hacker.create(name: auth.info.name,
                             username: auth.info.nickname,
                             email: auth.info.email,
                             provider: auth.provider,
                             uid: auth.uid,
                             github_token: auth.credentials.token,
                             password: Devise.friendly_token[0,20])
    end
    hacker
  end

  def github
    @github ||= Github.new oauth_token: github_token
  end

  def claim(task)
    if task.claimable?
      c = Claim.new
      c.task = task
      c.hacker = self
      c.claimed_at = Time.now
      c.save
    else
      return false
    end
  end

  def claimed?(task)
    return claimed_tasks.include?(task)
  end

  def finish(task)
    return false if task.done
    task.done = true
    task.finisher = self
    task.finished_at = Time.now
    task.save
  end

end
