require "rails_helper"

describe "editing existing links" do
  fixtures :all

  it "allows editing of link titles" do
    page.set_rack_session(user_id: 1)
    visit("/")

    click_on("#edit-link-1")

    expect(page).to have_content("Edit Link Information")
    fill_in("#new_title", with: "New Link Title")

    click_on("Save")

    expect(current_path).to eq(root_path)
    expect(page).to have_content("New Link Title")
  end

  xit "allows editing of link url" do
    page.set_rack_session(user_id: 1)
    visit("/")

    click_on("#link-1-edit-button")

    expect(page).to have_content("Edit Link Information")
    fill_in("#new_url", with: "https://www.givewell.org")

    click_on("Save")

    expect(current_path).to eq(root_path)
    expect(page).to have_content("https://www.givewell.org")
  end

  xit "rejects urls which are invalid" do
    page.set_rack_session(user_id: 1)
    visit("/")

    click_on("#link-1-edit-button")

    expect(page).to have_content("Edit Link Information")
    fill_in("#new_url", with: "something wrong")

    click_on("Save")

    expect(current_path).to eq(root_path)
    expect(page).to have_content("Link is invalid")
  end
end
