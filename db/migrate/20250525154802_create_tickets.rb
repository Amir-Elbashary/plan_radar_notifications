class CreateTickets < ActiveRecord::Migration[7.2]
  def change
    create_table :tickets do |t|
      t.references :user, foreign_key: true
      t.string :title
      t.text :description
      t.date :due_date, index: true
      t.integer :status_id
      t.integer :progress

      t.timestamps
    end
  end
end
