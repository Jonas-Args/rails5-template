require 'rails_helper'

describe 'POST /api/v1/cars' do

  context 'when creating a car' do

    def valid_params
      {
          car_attributes_attributes:[
            {name: "window", value: "4"}
          ],
          rates_attributes:[
            {per:"day",price:"100"}
          ]
      }
    end

    context 'with valid params' do
      it 'creates a car' do
        driver_auth_post "/api/cars", car: valid_params
        expect(response_json['id'].present?).to be_truthy
      end
    end

    context 'with invalid params' do
      it 'returns validation error' do
        driver_auth_post "/api/cars", car: {car_attributes_attributes:[],rates_attributes:[]}
        expect(response_json['message']).to eq "Validation failed"
      end
    end

  end
end
