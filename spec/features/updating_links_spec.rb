require "rails_helper"

describe "updating existing links" do
  fixtures :all

  it "allows updating from Read to Unread" do
    page.set_rack_session(user_id: 1)
    visit("/")

    find('#1').click

    expect(current_path).to eq(root_path)
    expect(page).to have_link("Change Status")
  end
end
