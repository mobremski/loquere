require "rails_helper"

RSpec.describe Post, type: :model do
  it { is_expected.to validate_presence_of(:user_id) }
  it { is_expected.to validate_presence_of(:meetup_id) }
  it { is_expected.to validate_presence_of(:body) }
end
