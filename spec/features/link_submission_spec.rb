require "rails_helper"

describe "user submitting links" do
  fixtures :all
  context "with no links previously submitted" do
    it "shows an authenticated user a submission form" do
      page.set_rack_session(user_id: 1)
      visit("/")

      expect(page).to have_field("link_title")
      expect(page).to have_field("link_url")
    end

    it "shows the user their links" do
      page.set_rack_session(user_id: 1)
      visit("/")

      expect(page).to have_selector("link_details", count: 2)
    end
  end
end
