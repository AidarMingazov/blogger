class UserDecorator < ApplicationDecorator
  delegate_all

  def full_name
    if first_name.blank? && last_name.blank?
      'No name provided.'
    else
      "#{ first_name } #{ last_name }".strip
    end
  end

  def post_owner(post)
    "#{ full_name_by_post(post) } #{ nickname_by_post(post) }".strip
  end

  def full_name_by_post(post)
    # TODO Why you are searching for user? You can use:
    # user = user.post
    # If some post exists - it should have user! Just add validation
    # to be sure that post will not be saved withoud user_id
    user = User.find(post.user_id)

    if user.first_name.blank? && user.last_name.blank?
      'No name provided.'
    else
      "#{ user.first_name } #{ user.last_name }".strip
    end
  end

  def nickname_by_post(post)
    # TODO get_nickname(post.user)
    get_nickname(User.find(post.user_id))
  end

  def at_nickname
    "@#{ nickname }"
  end

  def get_nickname(user)
    "@#{ user.nickname }"
  end

  def joined_at
    created_at.strftime("%B %Y")
  end
end
