require "rails_helper"

describe "user submitting links" do
  fixtures :all

  it "shows an authenticated user a submission form" do
    page.set_rack_session(user_id: 1)
    visit("/")

    expect(page).to have_field("link_title")
    expect(page).to have_field("link_url")
  end

  it "shows the user their links" do
    page.set_rack_session(user_id: 1)
    visit("/")

    expect(page).to have_selector(".link_details", count: 2)
  end

  it "adds a valid link to the list when submitted" do
    link_params = {
      title: "Great Site!",
      url: "http://www.google.com"
    }
    page.set_rack_session(user_id: 1)
    visit("/")

    fill_in "link_title", with: link_params[:title]
    fill_in "link_url", with: link_params[:url]
    click_on "Save"

    expect(page).to have_selector(".link_details", count: 3)
    expect(page).to have_content("Great Site!")
    expect(page).to have_link("http://www.google.com")
  end

  it "gives an error message for no title" do
    page.set_rack_session(user_id: 1)
    visit("/")

    fill_in "link_url", with: "http://www.mysite.url"
    click_on "Save"

    expect(page).to have_content("Link is invalid")
  end

  it "gives an error message for invalid url" do
    page.set_rack_session(user_id: 1)
    visit("/")

    fill_in "link_title", with: "url is invalid!"
    # fill_in "link_url", with: "invalid"
    click_on "Save"

    expect(page).to have_content("Link is invalid")
  end
end
