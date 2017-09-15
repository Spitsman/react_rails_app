class User < ActiveRecord::Base

  acts_as_authentic do |c|
    c.crypto_provider = Authlogic::CryptoProviders::BCrypt
  end

  validates :first_name, presence: true
  validates :last_name, presence: true

  has_many :requests

  def client?
    !self.admin?
  end

end