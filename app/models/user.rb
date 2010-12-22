class User < ActiveRecord::Base
  has_many :goals, :dependent => :destroy
  has_many :tasks, :dependent => :destroy
  has_many :achievements, :dependent => :destroy
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # https://github.com/plataformatec/devise/wiki/How-To:-Allow-users-to-sign_in-using-their-username-or-email-address
  attr_accessor :login

  # Setup accessible (or protected) attributes for your model
  attr_accessible :login, :name, :email, :password, :password_confirmation, :remember_me
  
  protected

    def self.find_for_database_authentication(conditions)
      value = conditions[authentication_keys.first]
      where(["name = :value OR email = :value", { :value => value }]).first
    end
end
