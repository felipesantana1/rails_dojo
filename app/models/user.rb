class User < ActiveRecord::Base

  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i

  validates :first_name, :last_name, presence: true, length: { in: 2..20 }
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
  validates :password, presence: true, on: :create, length: { in: 5..25 } 

  has_many :organizations, dependent: :destroy
  has_many :joined_groups, through: :joins, source: :organization, dependent: :destroy
  has_many :joins, dependent: :destroy
  has_secure_password
end
