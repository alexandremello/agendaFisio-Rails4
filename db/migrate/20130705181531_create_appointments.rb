class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.datetime :start
      t.datetime :end
      t.text :description
      t.integer :patient_id
      t.string :title

      t.timestamps
    end
  end
end
