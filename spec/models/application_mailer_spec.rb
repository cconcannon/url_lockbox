require 'spec_helper'

RSpec.describe ApplicationMailer, type: :mailer do
  fixtures :links

  describe "send_email" do
    let(:email) { described_class.send_email("chris@turing.io", Link.first).deliver_now }

    it "renders the subject" do
      expect(email.subject).to eq("Link Forwarded")
    end
  end
end
