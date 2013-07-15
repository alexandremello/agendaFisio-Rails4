class Exam < ActiveRecord::Base
	validates_presence_of :date, :patient_id

	belongs_to :patient
end
