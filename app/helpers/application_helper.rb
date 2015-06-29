module ApplicationHelper
  def title(title)
    @page_title = title
  end

  def attribute_for(object, attribute, options = {})
    value = options[:value] || object.send(attribute)
    "<p><strong>#{object.class.human_attribute_name(attribute)}</strong><br> #{value}</p>".html_safe
  end

  def chakra_image(chakra)
    chakra = chakra.split("_").last
    image_tag "chakra_#{chakra}.jpg", alt: "", class: "chakra-image"
  end

  def pretty_clock
    local_time.strftime("%H:%M")
  end

  def raga_suggestion
    raga_suggestion = Raga.playable.where(time: time_to_prahar).sample
    "Why not try raga #{link_to(raga_suggestion, raga_suggestion)}.".html_safe
  end

  def local_time
    Time.now.utc + session[:time_zone_offset]
  end

  def time_to_prahar
    prahar_and_hours.each do |prahar, time_range|
      return prahar if time_range.include?(local_time.hour)
    end
  end

  def swf_tag(filename, width: "100%", height: "100%", flashvars: {})
    flashvars = Rack::Utils.build_query flashvars
    swf_path = asset_path(filename)

    <<-HTML.html_safe
<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" width="#{width}" height="#{height}" align="middle">
  <param name="movie" value="#{swf_path}"/>
  <param name="FlashVars" value="#{flashvars}" />
  <!--[if !IE]>-->
  <object type="application/x-shockwave-flash" data="#{swf_path}" width="#{width}" height="#{height}">
    <param name="movie" value="#{swf_path}"/>
    <param name="FlashVars" value="#{flashvars}" />
  </object>
  <!--<![endif]-->
</object>
    HTML
  end

  private
  def prahar_and_hours
    ActiveSupport::OrderedHash[
      1, 6..8,
      2, 9..11,
      3, 12..14,
      4, 15..17,
      5, 18..20,
      6, 21..23,
      7, [23, 0, 1, 2],
      8, 3..5
    ]
  end
end
