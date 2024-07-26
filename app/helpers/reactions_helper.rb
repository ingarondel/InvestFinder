module ReactionsHelper
  def reaction_counts(reactable)
    likes_count = reactable.reactions.likes.count
    dislikes_count = reactable.reactions.dislikes.count
    { likes_count: likes_count, dislikes_count: dislikes_count }
  end
end
