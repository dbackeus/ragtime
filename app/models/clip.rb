class Clip
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :raga

  field :title, type: String
  field :url, type: String
  field :embed_code, type: String
  field :thumbnail_url, type: String

  validates_presence_of :raga
  validates_presence_of :url
  validates_presence_of :title, if: :url
  validate :validate_info, if: lambda { |clip| clip.url.present? }

  before_validation :set_attributes_from_info, if: lambda { |clip| clip.info }
 
  def info
    @video_info ||= VideoInfo.get(url, iframe_attributes: { width: 425, height: 344 })
  end

  private
  def validate_info
    errors.add(:url, :invalid) unless info
  end

  def set_attributes_from_info
    self.title = info.title unless self.title.present?
    self.thumbnail_url = info.thumbnail_medium
    self.embed_code = info.embed_code
  end
end
