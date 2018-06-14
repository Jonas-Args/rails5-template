require 'rails_helper'

describe 'PATCH /api/v1/users' do

  context 'when updating a user' do
    let!(:user) {create(:user)}

    def valid_params
      {
        email: 'new@email.com'
      }
    end

    context 'with valid params' do
      it 'updates a user' do
        auth_patch "/api/users/#{user.id}", user: valid_params
        expect(response_json['user']['email']).to eq valid_params[:email]
      end
    end

    context 'with invalid params' do
      it 'returns validation error' do
        auth_patch "/api/users/#{user.id}", user: { email: 'invalid.com' }
        expect(response_json['message']).to eq "Validation failed"
      end
    end

  end
end
