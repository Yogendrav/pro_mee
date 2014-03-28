class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :project_title
      t.string :project_created_by
      t.integer :project_created_on
      t.text :project_details
      t.integer :project_starts_on
      t.integer :project_ends_on
      t.string :status
      t.string :invite_people

      t.timestamps
    end
  end
end
