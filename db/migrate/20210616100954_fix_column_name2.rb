class FixColumnName2 < ActiveRecord::Migration[6.1]
  def change
    rename_column :productions, :client, :client_id
  end
end
