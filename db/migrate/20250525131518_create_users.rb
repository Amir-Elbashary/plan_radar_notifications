class CreateUsers < ActiveRecord::Migration[7.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.boolean :send_due_date_reminder, default: true, index: true
      t.integer :due_date_reminder_interval, default: 0
      t.time :due_date_reminder_time
      t.string :time_zone


      t.timestamps
    end
  end
end
