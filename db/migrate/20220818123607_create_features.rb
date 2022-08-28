class CreateFeatures < ActiveRecord::Migration[6.1]
  def change
    create_table :features do |t|
      t.string :Title
      t.string :Description
      t.string :Category
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
