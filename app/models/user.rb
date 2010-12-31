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
  attr_protected  :goals, :tasks, :achievements
  
  # normalize name/email, and ensure uniqueness of name (email already checked by Devise)
  before_save :downcase_login
  validates :name, {:uniqueness => {:case_sensitive => false}}
  
  protected
    
    def downcase_login
      self.email.downcase! if self.email
      self.name.downcase! if self.name
    end
    
    def self.find_for_database_authentication(conditions)
      value = conditions[authentication_keys.first]
      value.downcase! if value
      where(["name = :value OR email = :value", { :value => value }]).first
    end
end
