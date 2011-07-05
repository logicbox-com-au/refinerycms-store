module WornHelper
  def worn_button(obj)
    if member_signed_in?
      if obj.worn_by?(current_member)
        link = link_to "#{obj.worns.count} UNWORN", worn_path(:wornable_id => obj.id, :wornable_type => obj.class.name), :method => :delete
      else
        link = content_tag(:div, "#{obj.worns.count} WORN".html_safe + get_kinds_list(obj),{:class => "worns"})
      end
    else
      link = link_to "#{obj.worns.count} WORN", new_member_session_path
    end
    count = obj.worns.count
    content_tag(:div, link, {:id => 'worns'})
  end

  def get_kinds_list(obj)
    content_tag(:ul, :class => "worns") { ["day", "work", "evening"].each do |kind|
      li = link_to kind, worn_path(:wornable_id => obj.id,
                                   :wornable_type => obj.class.name,
                                   :kind => kind), :remote => true, :method => :post
      concat(content_tag(:li, li))
    end }
  end

  def worn_counter(obj)
    content_tag(:span, "#{obj.worns.count} WORN", :class => 'wornCount')
  end
end
