class Comment < ApplicationRecord
  belongs_to :author
  belongs_to :post

  after_save :update_comments_counter

  def update_comments_counter
    post.increment!(:commentsCounter)
  end
end