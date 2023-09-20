class Like < ApplicationRecord
  belongs_to :author
  belongs_to :post

  after_save :update_likes_counter

  def update_likes_counter
    post.increment!(:likesCounter)
  end
end