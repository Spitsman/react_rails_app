class Request < ActiveRecord::Base

  attr_accessor :current_user

  has_paper_trail ignore: [:updated_at]

  has_and_belongs_to_many :users
  has_one :answer, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true
  validates :amount, presence: true

  def answered?
    self.answer.present?
  end

end