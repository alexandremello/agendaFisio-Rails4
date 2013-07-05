class Patient < ActiveRecord::Base
  has_one :user
  has_many :exams

  validates :name, presence: true

  def username
  	if self.user
  		self.user.email
  	else
  		'No user'
  	end
  end

  def last_exam
    exam = self.exams.order("date desc").first()
    if exam
      exam.date
    else
      'No exams'
    end
  end
end
