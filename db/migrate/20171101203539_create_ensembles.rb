class CreateEnsembles < ActiveRecord::Migration[5.1]
  def change
    create_table :ensembles do |t|
      t.string :name
      t.integer :host_id

      t.timestamps
    end
  end
end
