class PostDecorator < ApplicationDecorator
  delegate_all

  def published_at(post)
    post.created_at.strftime("%B %Y")
  end
end
