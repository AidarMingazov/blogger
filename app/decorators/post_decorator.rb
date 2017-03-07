class PostDecorator < ApplicationDecorator
  delegate_all

  def published_at(post)
    post.created_at.strftime("%d %B %Y")
  end

  def published_at_by_post(feed)
    feed.created_at.strftime("%d %B %Y")
  end

end
