require 'rails_helper'

describe Link do
  it { should validate_presence_of :url }
  it { should validate_presence_of :title }
  it { should validate_presence_of :user_id }

  xit "should not allow an invalid url" do
    link = Link.new({
      title: "new link",
      url: "garbage",
      user_id: 1
    })

    expect(link.valid?).to be_falsey
    expect(link.save).to be_falsey
  end
end
