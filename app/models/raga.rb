class Raga
  include Mongoid::Document
  include Mongoid::Timestamps

  has_many :clips
  field :clips_count, type: Integer, default: 0

  field :title, type: String
  field :description, type: String
  field :ascending_scale, type: String
  field :descending_scale, type: String
  field :pakad, type: String
  field :drone, type: String
  field :time, type: String
  field :chakra, type: String
  field :spotify_playlist_url, type: String
  field :url, type: String
  field :thaat, type: String
  field :vaadi, type: String
  field :samvaadi, type: String

  validates_presence_of :title
  validates_presence_of :ascending_scale
  validates_presence_of :descending_scale

  validates_uniqueness_of :title, :case_sensitive => false

  acts_as_url :title, :sync_url => true

  def self.playable
    self.or({:spotify_playlist_url.ne => nil}, {:clips_count.gt => 0})
  end

  def to_s
    title
  end

  def to_param
    url
  end

  def pretty_time
    Raga.time_options.invert[time]
  end

  def pretty_chakra
    Raga.chakra_options.invert[chakra]
  end

  # Strip beginning of "Rag Puriya Kalyan: spotify:user:duztdruid:playlist:11Nsl0P9qDqbvDTwu5WB5d")
  def spotify_playlist_url=(url)
    if url.present?
      url = url["spotify:"] ? url[url.rindex("spotify:")..-1] : url #
      write_attribute(:spotify_playlist_url, url)
    end
  end

  def self.time_options
    ActiveSupport::OrderedHash[
      "06-09", "1",
      "09-12", "2",
      "12-15", "3",
      "15-18", "4",
      "18-21", "5",
      "21-24", "6",
      "24-03", "7",
      "03-06", "8",
      "Monsoon", "m"
    ]
  end

  def self.chakra_options
    ActiveSupport::OrderedHash[
      "Left Mooladhara", "left_mooladhara",
      "Mooladhara", "mooladhara",
      "Right Mooladhara", "right_mooladhara",
      "Left Swadisthan", "left_swadisthan",
      "Swadisthan", "swadisthan",
      "Right Swadisthan", "right_swadisthan",
      "Left Nabhi", "left_nabhi",
      "Nabhi", "nabhi",
      "Right Nabhi", "right_nabhi",
      "Void", "void",
      "Left Heart", "left_heart",
      "Heart", "heart",
      "Right Heart", "right_heart",
      "Left Vishuddhi", "left_vishuddhi",
      "Vishuddhi", "vishuddhi",
      "Right Vishuddhi", "right_vishuddhi",
      "Left Agnya", "left_agnya",
      "Agnya", "agnya",
      "Right Agnya", "right_agnya",
      "Left Sahastrara", "left_sahasrara",
      "Sahastrara", "sahasrara",
      "Right Sahastrara", "right_sahasrara"
    ]
  end
end
