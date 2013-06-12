class User < ActiveRecord::Base

  #has_one :actor

  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :token_authenticatable,
         :confirmable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :authentication_token
  # attr_accessible :title, :body

  before_save :ensure_authentication_token

  validate :email_validation


  protected
  def email_validation
    domain = email.split("@").last

    errors.add :email, "#{domain} is blacklisted}" if Companies["blacklist"].include? domain
    errors.add :email, "#{domain} is not whitelisted}" unless Companies["whitelist"].include? domain
  end

end
