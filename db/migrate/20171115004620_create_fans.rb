class CreateFans < ActiveRecord::Migration[5.1]
  def change
    create_table :fans do |t|
      t.integer "followed_id"
      t.integer "follower_id"

      t.datetime
      t.datetime 
    end
  end
end
