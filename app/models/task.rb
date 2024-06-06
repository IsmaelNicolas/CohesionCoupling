class Task < ApplicationRecord
  belongs_to :project
  has_many :assignments
  has_many :users, through: :assignments

  enum status: { pending: 0, in_progress: 1, completed: 2 }
end
