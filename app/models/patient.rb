class Patient < ActiveRecord::Base
  has_one :user
  has_many :exams
  has_many :appointments

  validates :name, presence: true
end
