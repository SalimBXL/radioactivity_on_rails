class FixColumnName3 < ActiveRecord::Migration[6.1]
  def change
    rename_column :commandes, :activity_unit, :activity_unit_id
  end
end
