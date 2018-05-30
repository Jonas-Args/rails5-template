require 'rails_helper'

Resource::TYPES.each do |resource|
  split = resource.split(/(?=[A-Z])/).map(&:downcase).join("_")
  describe "POST /api/#{split.pluralize}" do

    let(:new_attributes) { attributes_for(:resource, split.to_sym, bank: current_user.bank, alias: Faker::Name.name) }
    let("existing_#{split}".to_sym) { create(:resource, split.to_sym, bank: current_user.bank) }

    def post_request(split, attributes)
      auth_post "/api/#{split.pluralize}", resource: attributes
    end

    context 'successful create' do
      it "creates a #{split}" do
        expect {
          post_request(split,new_attributes)
        }.to change { eval(resource).count }.by 1
      end

      it 'assigns creator and updator' do
        post_request(split,new_attributes)
        expect(json_response).to include 'id'
        expect(json_response['creator_id']).to eq(current_user.id)
        expect(json_response['updator_id']).to eq(current_user.id)
      end

      it 'should create a create log' do
        post_request(split,new_attributes)
        expect(Logs::Resources.jobs.size).to eql 1
      end

    end

    context 'incorrect form parameters' do
      it 'returns an error message' do
        post_request(split,name: nil)
        expect(response.status).to eql 422
        expect(json_response['errors']).to include "Name can't be blank"
      end
    end
  end
end
