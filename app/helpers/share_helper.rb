module ShareHelper
  def share_button(obj)
    if member_signed_in?
      link = content_tag(:div, "SHARE".html_safe + get_share_list(obj),{:class => "worns"})
    else
      link = link_to "SHARE", new_member_session_path
    end
    content_tag(:div, link, {:id => 'share'})
  end

  def get_share_list(obj)
    content_tag(:ul){
      mail = mail_to '','Mail', :subject => "[1O5 LOOKS]: #{obj.title}", :body => "#{obj.title} at #{video_path(obj)}"
      concat(content_tag(:li, mail))
      tweet = link_to 'Tweet', 'http://twitter.com/share', 'data-url' => video_path(obj), 'data-text' => "#{obj.title}", 'data-count' => 'none', 'data-via' => '1O5LOOKS', 'data-lang' => 'en', :class => "twitter-share-button"
      concat(content_tag(:li, tweet,{:id => "tweet"}))
      face =  link_to 'Facebook', '', :share_url => video_path(obj), :name => 'fb_share'
      concat(content_tag(:li, face, {:id => "face"}))
    }
  end

end