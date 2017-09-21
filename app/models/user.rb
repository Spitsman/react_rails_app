class User < ActiveRecord::Base

  acts_as_authentic do |c|
    c.crypto_provider = Authlogic::CryptoProviders::BCrypt
  end

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true

  has_and_belongs_to_many :requests, dependent: :destroy

  scope :clients, -> { where(admin: false) }
  scope :admins, -> { where(admin: true) }
  scope :unconfirmed, -> { where(email_confirmed: false) }

  before_create :generate_confirmation_token

  def client?
    !self.admin?
  end

  def role
    self.admin? ? 'admin' : 'client'
  end

  def email_activate!
    self.email_confirmed = true
    self.confirm_token = nil
    save!(validate: false)
  end

  protected

  def generate_confirmation_token
    self.confirm_token = SecureRandom.urlsafe_base64.to_s
  end

end