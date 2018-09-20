class Visit < ApplicationRecord
  has_many :visiting_users
  has_many :users, through: :visiting_users

  belongs_to :location

  validates :location, presence: true
  validates :visited_at, presence: true
  validates :users, presence: true

  def visitors=(visitors)
    self.users = visitors
  end
end
