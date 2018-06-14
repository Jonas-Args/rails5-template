require 'rails_helper'

describe 'POST /api/v1/sessions' do
  context 'when creating a session' do

      before do
        user = User.new(email: 'foo@bar.com', password: 'password')
        user.save(validate: false)
      end

      context 'with valid params' do
        it 'creates a session' do
          post "/api/sessions", params:{ user: {email: 'foo@bar.com', password: 'password'}}

          expect(response_json['user']['id'].present?).to be_truthy
        end
      end

      context 'with invalid params' do
        it 'returns validation error' do
          post "/api/users", params:{ user: {email:'foo@bar.com', password: 'invalid'}}
          expect(response_json['message']).to eq "Validation failed"
        end
      end
  end
end
