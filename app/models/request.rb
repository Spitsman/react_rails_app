class Request < ActiveRecord::Base

  attr_accessor :current_user

  has_and_belongs_to_many :users
  has_one :answer, dependent: :destroy
  has_many :histories

  validates :title, presence: true
  validates :body, presence: true
  validates :amount, presence: true

  def answered?
    self.answer.present?
  end

  after_save do
    self.changes.except(:created_at, :updated_at).each do |field, values|
      self.histories.create(
        user_id: current_user.id,
        user_role: current_user.role,
        created_at: Time.now,
        old_value: values.first,
        new_value: values.second,
        field: field
      )
    end
  end

end