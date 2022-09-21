class RemoveAdminFromProjects < ActiveRecord::Migration[6.1]
  def change
    remove_column :projects, :admin, :string
  end
end
