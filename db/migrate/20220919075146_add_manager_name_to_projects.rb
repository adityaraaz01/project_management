class AddManagerNameToProjects < ActiveRecord::Migration[6.1]
  def change
    add_column :projects, :manager_name, :string
  end
end
