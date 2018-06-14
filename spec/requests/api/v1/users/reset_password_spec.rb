require 'rails_helper'

describe 'PATCH /api/v1/users/reset_password' do
  let!(:user) {create(:user)}

    context 'with a valid token' do
      before do
        user.set_forgot_token
      end

      it 'resets password' do
        token = user.forgot_tokens.last.token
        patch "/api/users/reset_password", params:{access_token: token, password: "new_password"}
        expect(response_json['user']["id"]).to be_truthy
      end
    end

    context 'with invalid token' do
      it 'resets password' do
        patch "/api/users/reset_password", params:{access_token: 'token', password: "new_password"}
        expect(response_json["error"]).to be_truthy
      end
    end


end
