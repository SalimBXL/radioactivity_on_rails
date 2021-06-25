class AddActivityUnitToCommands < ActiveRecord::Migration[6.1]
  def change
    add_column :commandes, :activity_unit, :integer
  end
end
