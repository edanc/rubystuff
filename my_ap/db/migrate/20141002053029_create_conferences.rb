class CreateConferences < ActiveRecord::Migration
  def change
    create_table :conferences do |t|
      t.string :name
      t.string :location
      t.date :date
      t.time :start_time
      t.time :end_time

      t.timestamps
    end
  end
end
