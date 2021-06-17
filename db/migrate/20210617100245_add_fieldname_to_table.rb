class AddFieldnameToTable < ActiveRecord::Migration[6.1]
  def change
    add_column :productions, :client, :integer
  end
end
