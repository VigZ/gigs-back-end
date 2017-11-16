class CreateRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :requests do |t|
      t.integer :user_id
      t.integer :ensemble_id
      t.string :message
      t.boolean :accepted, :default => false

      t.timestamps
    end
  end
end
