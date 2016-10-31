require "rails_helper"

describe "new user visiting the site" do
  context "and the user is unauthenticated" do
    it "redirects the user to log in or sign up" do
      visit "/"

      expect(page).to have_content "Log In"
      expect(page).to have_content "Sign Up"
      expect(current_path).to_not eq("/")
    end

    it "has a signup form with required fields" do
      visit "/"
      click_on "New User Sign Up"

      expect(page).to have_field("user_email")
      expect(page).to have_field("user_password")
      expect(page).to have_field("user_password_confirm")
    end

    it "must not allow signup with duplicate email" do
      user_params = {
        email: "duplicate_dude@userstories.com",
        password: "secure password"
      }
      User.create!(user_params)

      visit "/users/new"
      fill_in "user_email", with: user_params[:email]
      fill_in "user_password", with: user_params[:password]
      fill_in "user_password_confirm", with: user_params[:password]
      click_on "Sign Up"

      expect(page).to have_content "Error: Email is already in use"
      expect(current_path).to eq(new_user_path)
    end

    it "must recognize a password confirmation mismatch" do
      user_params = {
        email: "mismatch_mary@userstories.com",
        password: "password"
      }

      visit "/users/new"
      fill_in "user_email", with: user_params[:email]
      fill_in "user_password", with: user_params[:password]
      fill_in "user_password_confirm", with: "not the same"
      click_on "Sign Up"

      expect(page).to have_content "Error: Password did not match"
      expect(current_path).to eq(new_user_path)
    end

    it "must create a new user with valid attributes" do
      user_params = {
        email: "new_user@userstories.com",
        password: "password",
        password_confirm: "password"
      }

      visit "/users/new"
      fill_in "user_email", with: user_params[:email]
      fill_in "user_password", with: user_params[:password]
      fill_in "user_password_confirm", with: user_params[:password_confirm]
      click_on "Sign Up"

      expect(current_path).to eq(root_path)
      expect(page).to have_link("Logout")
      expect(page.get_rack_session_key("user_id")).to_not be_nil
    end
  end
end
