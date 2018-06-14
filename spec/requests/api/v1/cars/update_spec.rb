require 'rails_helper'

describe 'PATCH /api/v1/cars' do

  context 'when updating a car' do
    let!(:car) {create(:car)}

    def valid_params
      {
        id: car.id,
          car_attributes_attributes:[
            {id: car.car_attributes.first.id,
              value: "5"}
          ],
          rates_attributes:[
            {per:"hour",price:10}
          ]
      }
    end

    context 'with valid params' do
      it 'updates a car' do
        expect{
          driver_auth_patch "/api/cars/#{car.id}", car: valid_params
        }.to change { car.reload.car_attributes[0].value }.from("4").to("5")
        .and change { car.rates.count }.from(1).to(2)
      end
    end

    context 'with invalid params' do
      it 'returns validation error' do
        driver_auth_patch "/api/cars/#{car.id}", car: {
          rates_attributes:[{per:"hour",price:"ten"}]}
        expect(response_json['message']).to eq "Validation failed"
      end
    end

  end
end
