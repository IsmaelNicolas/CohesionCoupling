class User < ApplicationRecord
  has_many :projects, dependent: :destroy
  has_many :led_projects, class_name: 'Project', foreign_key: 'leader_id', dependent: :nullify
  has_many :assignments
  has_many :tasks, through: :assignments
end
