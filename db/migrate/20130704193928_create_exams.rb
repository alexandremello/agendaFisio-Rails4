class CreateExams < ActiveRecord::Migration
  def change
    create_table :exams do |t|
      t.date :date, default: Time.now
      t.text :description
      t.integer :patient_id

      t.timestamps
    end
  end
end
