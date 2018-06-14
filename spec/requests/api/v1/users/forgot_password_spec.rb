require 'rails_helper'

describe 'PATCH /api/v1/users/forogt_password' do
  context 'when a user forgot password' do

    let!(:user) {create(:user)}

    context 'with a valid email' do
      it "renders success" do
        patch "/api/users/forgot_password",  params:{ email: user.email }
        expect(response_json["success"]).to be_truthy
      end
    end

    context 'with invalid email' do
      it "renders success" do
        patch "/api/users/forgot_password", params:{ email: "invalid@email.com" }
        expect(response_json["error"]).to be_truthy
      end
    end

  end
end
