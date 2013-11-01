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
      Rails::logger.info("### Getting the users last name")
      tempname = Devise::LdapAdapter.get_ldap_param(self.username,"sn")
      Rails::logger.info "\tLDAP returned lastname of " + tempname
      self.lastname = tempname
  end
 
  def get_ldap_firstname
      Rails::logger.info("### Getting the users first name")
      tempname = Devise::LdapAdapter.get_ldap_param(self.username,"givenname")
      Rails::logger.info "\tLDAP returned firstname of " + tempname
      self.firstname = tempname
  end
 
  def get_ldap_email
      Rails::logger.info("### Getting the users email address")
      tempmail = Devise::LdapAdapter.get_ldap_param(self.username,"mail")
      Rails::logger.info "\tLDAP returned email of " + tempmail
      self.email = tempmail
  end

  def is_admin?
    role?(:admin)
  end

  def role?(role)
    return !!self.roles.find_by_name(role)
  end 
  
end
