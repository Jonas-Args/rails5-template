require 'rails_helper'

describe 'DELETE /api/v1/sessions' do
  context 'when logging out a user' do

      context 'with valid token' do
        it 'deletes a session' do
          auth_delete "/api/sessions"
          expect(response_json['success']).to be_truthy
        end
      end

      context 'with invalid token' do
        it 'returns validation error' do
          current_user.destroy_token
          auth_delete "/api/sessions"
          expect(response_json['error']).to be_truthy
        end
      end
  end
end
