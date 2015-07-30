class Url < ActiveRecord::Base

  validates :url, format: { with: /(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \.-]*)*\/?/, message: "is invalid"}
  validates :key, uniqueness: true
  before_create :generate_short_url

  def generate_short_url
    begin
      self.key = Faker::Lorem.characters(4)
    end until Url.where(key: key).empty?
  end
end

