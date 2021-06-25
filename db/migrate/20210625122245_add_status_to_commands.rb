class AddStatusToCommands < ActiveRecord::Migration[6.1]
  def change
    add_column :commandes, :status, :integer
  end
end
