class Picture < ApplicationRecord

  validates :artist, :title, :url, presence: true
  validates :title, length: {minimum: 3, maximum: 20}
  validates :url, uniqueness: true
  validates :url, format: { with: /https?:\/\/[\S]+/, message: "only http"}

  def self.newest_first
    Picture.order("created_at DESC")
  end

  def self.most_recent_five
    Picture.newest_first.limit(7)
  end

  def self.created_before(time)
    Picture.where("created_at < ?", time)
  end
  def self.pictures_created_in_year(year)
    Picture.where("cast(strftime('%Y', created_at) as int) = ?", year)
  end
end
