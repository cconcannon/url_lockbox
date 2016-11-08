require "rails_helper"

describe "editing existing links" do
  fixtures :all

  it "allows editing of link titles" do
    page.set_rack_session(user_id: 1)
    visit("/")

    find("#edit-link-1").click

    save_and_open_page
    expect(page).to have_content("Edit Link Information")
    fill_in("Title", with: "New Link Title")

    click_on("Save")

    expect(current_path).to eq(root_path)
    expect(page).to have_content("New Link Title")
  end

  it "rejects a blank title" do
    page.set_rack_session(user_id: 1)
    visit("/")

    find("#edit-link-1").click

    expect(page).to have_content("Edit Link Information")
    fill_in("Title", with: "")

    click_on("Save")

    expect(current_path).to eq(root_path)
    expect(page).to have_content("Link is invalid")
  end

  it "allows editing of link url" do
    page.set_rack_session(user_id: 1)
    visit("/")

    find("#edit-link-1").click

    expect(page).to have_content("Edit Link Information")
    fill_in("URL", with: "https://www.givewell.org")

    click_on("Save")

    expect(current_path).to eq(root_path)
    expect(page).to have_content("https://www.givewell.org")
  end

  it "rejects urls which are invalid" do
    page.set_rack_session(user_id: 1)
    visit("/")

    find("#edit-link-1").click

    expect(page).to have_content("Edit Link Information")
    fill_in("URL", with: "something wrong")

    click_on("Save")

    expect(current_path).to eq(root_path)
    expect(page).to have_content("Link is invalid")
  end
end
