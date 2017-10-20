class Organization < ActiveRecord::Base

  validates :name, presence: true, length: { in: 5..50 }
  validates :desc, presence: true, length: { in: 10..500 }  

  has_many :users
  has_many :joined_users, through: :joins, source: :user, dependent: :destroy
  has_many :joins, dependent: :destroy
  belongs_to :user
end
