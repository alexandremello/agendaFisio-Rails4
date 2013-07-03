class AddPatientIdToUser < ActiveRecord::Migration
  def change
  	add_column :users, :patient_id, :integer, :default => nil
  end
end
