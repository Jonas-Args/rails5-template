require 'rails_helper'
require 'faker'

describe 'POST /api/v1/users' do
  context 'when adding a user' do

    def valid_params
      {
        email: Faker::Internet.email,
        user_name: "user_name",
        password: "password",
        first_name: "first",
        last_name: "last"
      }
    end

      context 'with valid params' do
        it 'creates a user' do
          auth_post "/api/users", user:valid_params
          expect(response_json['user']['id'].present?).to be_truthy
        end
      end

      context 'with invalid params' do
        it 'returns validation error' do
          auth_post "/api/users", user:{user_name: "user_name"}
          expect(response_json['message']).to eq "Validation failed"
        end
      end
  end
end
