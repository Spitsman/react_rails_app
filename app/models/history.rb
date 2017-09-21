class History < ActiveRecord::Base

  validates :user, presence: true
  validates :request, presence: true
  validates :user_role, presence: true
  validates :created_at, presence: true
  validates :new_value, presence: true
  validates :field, presence: true

  belongs_to :user
  belongs_to :request

end