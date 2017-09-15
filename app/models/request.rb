class Request < ActiveRecord::Base

  has_and_belongs_to_many :users
  has_one :answer, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true
  validates :amount, presence: true

  def answered?
    self.answer.present?
  end

end