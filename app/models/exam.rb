class Exam < ActiveRecord::Base
	belongs_to :patient

	scope :desc, order("exam.date DESC")
end
