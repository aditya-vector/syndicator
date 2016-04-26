require 'rss'
class Feed < ActiveRecord::Base
  validates :location,
    presence: true,
    format: { with: URI.regexp }, if: proc { |f| f.location.present? }

  def details
    RSS::Parser.parse(location)
  rescue => e
    OpenStruct.new(error: e.message)
  end
end
