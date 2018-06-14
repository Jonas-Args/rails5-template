require 'rails_helper'

describe 'PATCH /api/v1/users/inactive' do
  context 'when making a user inactive' do

    let!(:user) {create(:user)}

    it 'makes a user inactive' do
      auth_patch "/api/users/inactive", nil, nil, user
      expect(response_json["user"]["is_active"]).to eq false
    end

  end
end
