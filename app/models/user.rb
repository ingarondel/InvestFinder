class User < ApplicationRecord
  has_many  :ideas, dependent: :destroy
  has_many  :comments,  dependent: :destroy
  has_many  :reactions, as: :reactable, dependent: :destroy

  devise    :database_authenticatable,
            :registerable,
            :recoverable,
            :rememberable,
            :trackable,
            :validatable,
            :confirmable
  validates :name, :surname, presence: true
end
