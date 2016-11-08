require 'uri'

class LinkEmailProcessor < ApplicationRecord
  def initialize(email, link)
    send_email(email, link)
  end

  def send_email(address, link)
    ApplicationMail.send_email(address, link).deliver_now
  end
end
