class User < ActiveRecord::Base

  acts_as_authentic do |c|
    c.crypto_provider = Authlogic::CryptoProviders::BCrypt
  end

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true

  has_many :favorite_teams, class_name: 'Team'

end
