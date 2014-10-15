class CreateLeads < ActiveRecord::Migration
  def change
    create_table :leads do |t|
      t.string :lead_id
      t.string :lead_first_name
      t.string :lead_last_name
      t.integer :conference_id
      t.integer :user_id


      t.timestamps
    end
  end
end
