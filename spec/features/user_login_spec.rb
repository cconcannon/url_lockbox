require "rails_helper"

describe "authenticated user visits the site" do
  it "allows them to log in successfully" do
    user_params = {
      email: "authenticated_person@example.com",
      password: "rage"
    }
    User.create!(user_params)

    visit "/"
    fill_in "user_email", with: user_params[:email]
    fill_in "user_password", with: user_params[:password]
    within("form") { click_on("Log In") }

    expect(current_path).to eq(root_path)
    expect(page).to have_content(user_params[:email])
    expect(page.get_rack_session["user_id"]).to_not be_nil
  end

  it "allows a logged in user to log out" do
    page.set_rack_session(user_id: 1)

    visit "/"
    click_on "Logout"

    expect(page.get_rack_session["user_id"]).to be_nil
  end
end
