class CreateTracers < ActiveRecord::Migration[6.1]
  def change
    create_table :tracers do |t|
      t.string :name
      t.string :molecule
      t.float :halflife

      t.timestamps
    end
  end
end
