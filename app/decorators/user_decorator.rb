class UserDecorator < ApplicationDecorator
  delegate_all
  
  def full_name
    if first_name.blank? && last_name.blank?
      'No name provided.'
    else
      "#{ first_name } #{ last_name }".strip
    end
  end

  def at_nickname
    "@#{ nickname }"
  end

  def joined_at
    created_at.strftime("%B %Y")
  end

end
