require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to validate_presence_of(:encrypted_password) }
  it { is_expected.to validate_presence_of(:first_name) }
  it { is_expected.to validate_presence_of(:last_name) }
  it { is_expected.to validate_presence_of(:screen_name) }
  it { is_expected.to validate_presence_of(:email) }
end
