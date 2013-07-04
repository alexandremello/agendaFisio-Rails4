class Patient < ActiveRecord::Base
  has_one :user
  has_many :exams

  validates :name, presence: true

  def username
  	if self.user
  		self.user.email
  	else
  		'Não cadastrado'
  	end
  end
end
