class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :avatar, :contact_no, :country, :state, :city, :address, :zipcode
  # attr_accessible :title, :body
  mount_uploader :avatar, AvatarUploader
  has_many :project_managements
  has_many :projects, through: :project_managements
end
