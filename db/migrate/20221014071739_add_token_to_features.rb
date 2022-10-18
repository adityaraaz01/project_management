class AddTokenToFeatures < ActiveRecord::Migration[6.1]
  def change
    add_column :features, :token_id, :string
  end
end
