class AddFieldnameToTablename < ActiveRecord::Migration[6.1]
  def change
    add_column :tracers, :color, :string
  end
end
