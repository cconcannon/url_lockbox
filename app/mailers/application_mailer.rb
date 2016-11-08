class ApplicationMailer < ActionMailer::Base
  default from: "noreply@cohort1605.turing.io"
  layout 'mailer'

  def send_email(email, link)
    @link = link
    @email = email
    mail(to: email, subject: "Link Forwarded")
  end
end
