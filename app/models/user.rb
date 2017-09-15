class User < ActiveRecord::Base

  acts_as_authentic do |c|
    c.crypto_provider = Authlogic::CryptoProviders::BCrypt
  end

  validates :first_name, presence: true
  validates :last_name, presence: true

  has_and_belongs_to_many :requests, dependent: :destroy

  scope :clients, -> { where(admin: false) }
  scope :admins, -> { where(admin: true) }

  def client?
    !self.admin?
  end

end