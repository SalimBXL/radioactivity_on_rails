class FixColumnName < ActiveRecord::Migration[6.1]
  def change
    rename_column :productions, :tracer, :tracer_id
  end
end
