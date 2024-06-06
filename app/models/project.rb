class Project < ApplicationRecord
  belongs_to :user # El usuario que está a cargo del proyecto
  has_many :tasks, dependent: :destroy
  belongs_to :leader, class_name: 'User', foreign_key: 'leader_id'
end
