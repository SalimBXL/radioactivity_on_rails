class AddSecondMeasureToProductions < ActiveRecord::Migration[6.1]
  def change
    add_column :productions, :second_measure, :float
  end
end
