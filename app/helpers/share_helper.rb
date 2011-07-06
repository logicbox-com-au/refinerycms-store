module ShareHelper
  def share_button(obj)
    link = content_tag(:div, "SHARE".html_safe + get_share_list(obj), {:class => "worns"})
    content_tag(:div, link, {:id => 'share'})
  end

  def get_share_list(obj)
    content_tag(:ul) {
      mail = mail_to '', 'Mail', :subject => "[1O5 LOOKS]: #{obj.title}", :body => "#{obj.title} at #{source_url(obj)}"
      concat(content_tag(:li, mail))
      tweet = link_to 'Tweet', 'http://twitter.com/share', 'data-url' => source_url(obj), 'data-text' => "#{obj.title}", 'data-count' => 'none', 'data-via' => '1O5LOOKS', 'data-lang' => 'en', :class => "twitter-share-button"
      concat(content_tag(:li, tweet, {:id => "tweet"}))
      face = link_to '', '', :share_url => source_url(obj), :name => 'fb_share'
      concat(content_tag(:li, face, {:id => "face"}))
    }
  end

  def source_url(obj)
    case obj.class.name
      when "Product" then
        product_url(obj)
      when "Video" then
        video_url(obj)
    end
  end

  def video_url video
    return basic_url(video) if video.type1 == 2 or video.type2 == 2
    return look_url(video) if video.type1 == 1 or video.type2 == 1
  end
end