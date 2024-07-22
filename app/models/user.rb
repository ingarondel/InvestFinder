class User < ApplicationRecord
  has_many  :ideas, dependent: :destroy

  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :confirmable
  validates :name, :surname, presence: true
end
