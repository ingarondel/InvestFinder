class Reaction < ApplicationRecord
  belongs_to :reactable, polymorphic: true
  belongs_to :user

  enum reaction_type: { like: 0, dislike: 1 }

  scope :likes, -> { where(reaction_type: :like) }
  scope :dislikes, -> { where(reaction_type: :dislike) }

  validates :reaction_type, presence: true
  validates :reaction_type, uniqueness: { scope: [:reactable_id, :reactable_type, :user_id] }
end
