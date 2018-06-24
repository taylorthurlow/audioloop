class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :rememberable, :trackable, :validatable

  has_many :subscriptions, dependent: :destroy
  has_many :artists, through: :subscriptions
end
