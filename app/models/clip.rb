class Clip
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :raga, touch: true, index: true, counter_cache: true

  field :title, type: String
  field :url, type: String
  field :embed_code, type: String
  field :thumbnail_url, type: String

  validates_presence_of :raga
  validates_presence_of :url
  validates_presence_of :title, if: :url
  validates_uniqueness_of :url, scope: :raga_id
  validate :validate_info, if: lambda { url.present? }

  before_validation :set_attributes_from_info, if: :info

  def info
    @video_info ||= VideoInfo.get(url)
  rescue VideoInfo::UrlError => e
    if e.message.downcase.include? "url is not usable"
      nil
    else
      raise
    end
  end

  private
  def validate_info
    errors.add(:url, :invalid) unless info
  end

  def set_attributes_from_info
    self.title = info.title unless self.title.present?
    self.thumbnail_url = info.thumbnail_medium
    self.embed_code = info.embed_code(iframe_attributes: { width: 425, height: 344 })
  end
end
