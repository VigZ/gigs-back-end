class CreateUserEnsembles < ActiveRecord::Migration[5.1]
  def change
    create_table :user_ensembles do |t|
      t.integer :user_id
      t.integer :ensemble_id

      t.timestamps
    end
  end
end
