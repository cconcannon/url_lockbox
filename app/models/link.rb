require 'uri'

class Link < ApplicationRecord
  belongs_to :user

  validates :url, presence: true
  validates :title, presence: true
  validates :read, absence: false
  validates :user_id, presence: true

  def validate_url(url = self.url)
    if url.split(" ").length > 1
      self.url = url.split(" ")[0]
      send_email(url) if url.split(" ").length == 3
    end
    uri = URI.parse(self.url)
    uri.kind_of?(URI::HTTP)
  rescue URI::InvalidURIError
    false
  end

  def send_email(user_input)
    ApplicationMailer.send_email(user_input.split(" ")[2], self).deliver_now
  end
end
