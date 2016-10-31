require 'rails_helper'

describe Link do
  it { should validate_presence_of :url }
  it { should validate_presence_of :title }
  it { should validate_presence_of :read }
  it { should validate_presence_of :user_id }
end
