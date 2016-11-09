class ApplicationMailer < ActionMailer::Base
  default from: "concach00@gmail.com"

  def send_email(email, link)
    @link = link
    @email = email
    mail(to: email, subject: "Link Forwarded")
  end
end
