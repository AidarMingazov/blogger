class UserDecorator < Draper::Decorator
  delegate_all

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

  # def email_or_request_button
  #   public_email ? email : h.link_to('Request Email', '#', class: 'btn btn-default btn-xs').html_safe
  # end

  def full_name
    if first_name.blank? && last_name.blank?
      'No name provided.'
    else
      "#{ first_name } #{ last_name }".strip
    end
  end

  def joined_at
    created_at.strftime("%B %Y")
  end

end
