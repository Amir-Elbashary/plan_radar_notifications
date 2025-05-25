class User < ApplicationRecord
  validates :name, :email, presence: :true

  has_many :tickets, dependent: :destroy
end