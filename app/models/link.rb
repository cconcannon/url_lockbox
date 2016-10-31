require 'uri'

class Link < ApplicationRecord
  belongs_to :user

  validates :url, presence: true, format: URI::regexp(%w(http https))
  validates :title, presence: true
  validates :read, absence: false
  validates :user_id, presence: true
end
