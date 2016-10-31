require 'uri'

class Link < ApplicationRecord
  belongs_to :user

  validates :url, presence: true
  validates :title, presence: true
  validates :read, absence: false
  validates :user_id, presence: true

  before_save :validate_url

  def validate_url
    uri = URI.parse(self.url)
    uri.kind_of?(URI::HTTP)
  end
end
