class User < ActiveRecord::Base

  has_many :users_roles
  has_many :roles, :through => :users_roles

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :ldap_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username, :firstname, :lastname
  # attr_accessible :title, :body

  before_save :get_ldap_lastname, :get_ldap_firstname, :get_ldap_email
 
  def get_ldap_lastname
    unless self.lastname
      tempname = Devise::LdapAdapter.get_ldap_param(self.username,"sn")
      self.lastname = tempname
    end
  end
 
  def get_ldap_firstname
    unless self.firstname
      tempname = Devise::LdapAdapter.get_ldap_param(self.username,"givenname")
      self.firstname = tempname
    end
  end
 
  def get_ldap_email
    unless self.email
      tempmail = Devise::LdapAdapter.get_ldap_param(self.username,"mail")
      self.email = tempmail
    end
  end

  def is_admin?
    role?(:admin)
  end

  def role?(role)
    return !!self.roles.find_by_name(role)
  end 
  
end
