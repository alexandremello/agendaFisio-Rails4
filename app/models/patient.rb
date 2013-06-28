class Patient < ActiveRecord::Base
  has_one :user

  validates_presence_of :name
end