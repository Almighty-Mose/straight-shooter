class CreateMeetings < ActiveRecord::Migration[5.2]
  def change
    create_table :meetings do |t|
      t.string :title
      t.string :address
      t.datetime :start_date
      t.datetime :end_date
      t.string :subject
      t.string :description
      t.integer :teacher_id
      t.integer :student_id
      t.integer :location_id

      t.timestamps
    end
  end
end
