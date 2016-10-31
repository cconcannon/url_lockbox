require "rails_helper"

describe "new user visiting the site" do
  context "and the user is unauthenticated" do
    it "redirects the user to log in or sign up" do
      visit "/"

      expect(page).to have_content "Log In or Sign Up"
      expect(current_path).to_not eq("/")
    end
  end
end
