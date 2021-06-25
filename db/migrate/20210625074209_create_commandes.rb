class CreateCommandes < ActiveRecord::Migration[6.1]
  def change
    create_table :commandes do |t|
      t.integer :tracer_id
      t.float :activity
      t.datetime :date
      t.integer :client_id

      t.timestamps
    end
  end
end
