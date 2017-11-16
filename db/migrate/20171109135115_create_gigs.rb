class CreateGigs < ActiveRecord::Migration[5.1]
  def change
    create_table :gigs do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.string :location
      t.string :info

      t.timestamps
    end
  end
end
