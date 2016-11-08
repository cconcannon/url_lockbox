require 'uri'

class Link < ApplicationRecord
  belongs_to :user

  validates :url, presence: true
  validates :title, presence: true
  validates :read, absence: false
  validates :user_id, presence: true

  before_save :validate_url

  def validate_url(url = self.url)
    if url.split(" ").length > 1
      extract_email(url)
    else
      validate_url_format(url)
    end
  end

  def extract_email(input)
    if input.split(" ")[2] == "\cc:"
      email = input.pop
      send_email(email)
      validate_url_format(input.shift)
    else
      false
    end
  end

  def validate_url_format(url)
    uri = URI.parse(url)
    uri.kind_of?(URI::HTTP)
  rescue URI::InvalidURIError
    false
  end

  def send_email(address)
  end
end
