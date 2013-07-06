class Patient < ActiveRecord::Base
  has_one :user
  has_many :exams
  has_many :appointments

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
      exam.date_formated
    else
      'No exams'
    end
  end

  def last_appointment
    appointment = self.appointments.where("start < ?", Time.now).order("start desc").first()
    if appointment
      appointment.start_date
    else
      'No prior appointments'
    end
  end

  def next_appointment
    appointment = self.appointments.where("start > ?", Time.now).order("start").first()
    if appointment
      appointment.start_date
    else
      'No next appointment'
    end
  end
end
