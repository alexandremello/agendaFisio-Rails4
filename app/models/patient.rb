class Patient < ActiveRecord::Base
  has_one :user
  has_many :exams
  has_many :appointments

  validates :name, presence: true

	def age
		now = Time.now.to_date
		now.year - birth.year - (birth.to_date.change(:year => now.year) > now ? 1 : 0)
	end
end
