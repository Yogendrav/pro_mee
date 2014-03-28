class Project < ActiveRecord::Base
  attr_accessible :project_title, :project_created_by, :project_created_on, :project_details, :project_starts_on, :project_ends_on, :status, :invite_people
  has_many :project_managements
  has_many :users, through: :project_managements
  STATUS = %w[Running Pending]
end
