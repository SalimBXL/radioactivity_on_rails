class CreateProductions < ActiveRecord::Migration[6.1]
  def change
    create_table :productions do |t|
      t.string :ref
      t.integer :tracer
      t.datetime :calibration_time
      t.float :calibration_value
      t.integer :calibration_unit
      t.string :description

      t.timestamps
    end
  end
end
