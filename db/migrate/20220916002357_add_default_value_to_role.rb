class AddDefaultValueToRole < ActiveRecord::Migration[7.0]
  def change
    change_column_default :users, :role, from: nil, to: "user"
  end
end
