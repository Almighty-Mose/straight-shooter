class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :username
      t.string :email
      t.boolean :student
      t.boolean :teacher
      t.string :password_digest
      t.integer :location_id

      t.timestamps
    end
  end
end
