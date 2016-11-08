require 'spec_helper'

RSpec.describe ApplicationMailer, type: :mailer do
  fixtures :links

  describe "send_email" do
    let(:email) { described_class.send_email("chris@turing.io", Link.first).deliver_now }

    it "renders the subject" do
      expect(email.subject).to eq("Link Forwarded")
    end

    it "renders the receiver email" do
      expect(email.to).to eq(["chris@turing.io"])
    end

    it "renders the sender email" do
      expect(email.from).to eq(["noreply@cohort1605.turing.io"])
    end
  end
end
