class Patient < ActiveRecord::Base
  has_one :user
  has_many :exams
  has_many :appointments

  validates :name, presence: true
  validates :name, uniqueness: true
  validates_length_of :name, minimum: 4

  validates :birth, presence: true

	def age
		now = Time.now.to_date
		now.year - birth.year - (birth.to_date.change(:year => now.year) > now ? 1 : 0)
	end
end
