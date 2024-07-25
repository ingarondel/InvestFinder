class Comment < ApplicationRecord
  has_many   :reactions, as: :reactable, dependent: :destroy
  belongs_to :idea
  belongs_to :user

  validates :content, presence: true
end
