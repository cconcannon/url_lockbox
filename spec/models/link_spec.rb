require 'rails_helper'

describe Link do
  it { should validate_presence_of :url }
  it { should validate_presence_of :title }
  it { should validate_presence_of :user_id }

  it "returns false for invalid URL" do
    invalid_link_params = {
      user_id: 1,
      title: "new URL",
      url: "bad"
    }

    link = Link.new(invalid_link_params)
    expect(link.validate_url).to be_falsey
  end

  it "returns true for valid URL" do
    valid_link_params = {
      user_id: 1,
      title: "new URL",
      url: "http://www.turing.io"
    }

    link = Link.new(valid_link_params)
    expect(link.validate_url).to_not be_falsey
  end
end
