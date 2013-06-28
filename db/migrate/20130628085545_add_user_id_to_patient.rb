class AddUserIdToPatient < ActiveRecord::Migration
  def change
    add_column :patients, :user_id, :integer, :default => nil
  end
end
