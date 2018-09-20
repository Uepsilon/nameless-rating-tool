class VisitingUser < ApplicationRecord
  belongs_to :visit
  belongs_to :user
end
