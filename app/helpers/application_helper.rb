module ApplicationHelper
  def title(title)
    @page_title = title
  end
  
  def attribute_for(object, attribute, options = {})
    value = options[:value] || object.send(attribute)
    "<p><strong>#{object.class.human_attribute_name(attribute)}:</strong> #{value}</p>".html_safe
  end

  def chakra_image(chakra)
    chakra = chakra.split("_").last
    image_tag "chakra_#{chakra}.jpg", :alt => ""
  end
  
  def raga_suggestion
    @time = Time.now.utc + session[:time_zone_offset]
    prahar = time_to_prahar
    raga_suggestion = Raga.with_spotify.where(time: prahar).sample
    "It's #{pretty_clock} o clock. Why not try raga #{link_to(raga_suggestion, raga_suggestion)}. Or view a #{link_to("list", ragas_path(:filter => {:time => prahar}))} of all ragas suitable for this time.".html_safe
  end
  
  private
  def time_to_prahar
    prahar_and_hours.each do |prahar, time_range|
      return prahar if time_range.include?(@time.hour)
    end
  end
  
  def pretty_clock
    @time.strftime("%H:%M")
  end
  
  def prahar_and_hours
    ActiveSupport::OrderedHash[
      1, 6..8,
      2, 9..11,
      3, 12..14,
      4, 15..17,
      5, 18..20,
      6, 21..23,
      7, 23..2,
      8, 3..5
    ]
  end
end
