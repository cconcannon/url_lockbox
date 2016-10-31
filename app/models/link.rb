class Link < ApplicationRecord
  belongs_to :user

  validates :url, presence: true
  validates :title, presence: true
  validates :read, presence: true
  validates :user_id, presence: true
end
