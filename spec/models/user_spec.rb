require 'rails_helper'

describe User, type: :model do
  it { should have_many(:access_tokens) }
  it { should have_many(:invite_tokens) }
  it { should have_many(:forgot_tokens) }
  it { should have_many(:cars) }

  describe '#email' do
    it { should_not allow_value("blah").for(:email) }
    it { should allow_value("a@b.com").for(:email) }
    it { should validate_presence_of(:email) }
  end

end
