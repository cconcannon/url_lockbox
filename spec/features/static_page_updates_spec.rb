require "rails_helper"

describe "filtering and updating without page refresh", js: true do
  fixtures :all

  it "allows filtering" do
    page.set_rack_session(user_id: 1)
    visit("/")
    within(first('.link_details')) {expect(page).to have_content("Link B")}
    page.find("#link_sort").click

    expect(current_path).to eq(root_path)
    within(first('.link_details')) {expect(page).to have_content("Link A")}
    expect(page).to have_selector('.link_details', count: 2)
  end

  it "allows change of read/unread status" do
    page.set_rack_session(user_id: 1)
    visit("/")
    within(first('.link_details')) do
      expect(page).to have_content("Read")
      page.find(".read_status_change").click
      expect(page).to have_content("Unread")
      page.find(".read_status_change").click
      expect(page).to have_content("Read")
    end
  end

  it "filters read/unread links" do
    page.set_rack_session(user_id: 1)
    visit("/")
    expect(page).to have_selector('.link_details', count: 2)
    page.find("#read_filter").click
    expect(page).to have_selector('.link_details', count: 1)
    page.find("#unread_filter").click
    expect(page).to have_selector('.link_details', count: 1)
    page.find("#all_filter").click
    expect(page).to have_selector('.link_details', count: 2)
  end
end
