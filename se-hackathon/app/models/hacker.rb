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
                  :remember_me, :provider, :uid, :as => [:default, :admin]
  # attr_accessible :title, :body

  has_and_belongs_to_many :hackathons

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
