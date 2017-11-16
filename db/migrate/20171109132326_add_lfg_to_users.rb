class AddLfgToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :LFG, :boolean, :default => true
  end
end
