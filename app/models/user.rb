class User < ApplicationRecord
  has_many :visiting_users
  has_many :visits, through: :visiting_users
  has_many :locations, through: :visits

  validates :first_name, presence: true
  validates :email, presence: true

  def full_name
    [first_name, last_name].join(' ')
  end
end
