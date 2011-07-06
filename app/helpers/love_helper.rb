module LoveHelper
  def love_button(obj)
    if member_signed_in?
      if obj.loved_by?(current_member)
       link = content_tag(:div, "#{obj.love.count} LOVE")
      else
        link = link_to "#{obj.love.count} LOVE", love_path(:loveable_id => obj.id, :loveable_type => obj.class.name), :remote => true, :method => :post
      end
    else
      link = link_to "#{obj.love.count} LOVE", new_member_session_path
    end
    count = obj.love.count
    content_tag(:div, link, {:id => 'votes'})
  end

  def love_counter(obj)
    content_tag(:span, "#{obj.love.count} LOVE", :class => 'loveCount')
  end
end
