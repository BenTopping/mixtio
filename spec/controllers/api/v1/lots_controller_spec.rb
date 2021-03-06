require 'rails_helper'

describe Api::V1::LotsController, type: :request do

  describe "GET #show" do

    it "should return a serialized lot" do
      lot = create(:lot)
      get api_v1_lot_path(lot)
      expect(response).to be_successful
      lot_response = JSON.parse(response.body, symbolize_names: true)

      expect(lot_response[:id]).to eql(lot.id)
      expect(lot_response[:number]).to eql(lot.number)

      consumable_type = lot_response[:consumable_type]
      expect(consumable_type[:id]).to eql(lot.consumable_type_id)

      kitchen = lot_response[:kitchen]
      expect(kitchen[:id]).to eql(lot.kitchen_id)
      expect(kitchen[:name]).to eql(lot.kitchen.name)
    end

    context "lot does not exist" do
      it "should return a 404 with an error message" do
        get api_v1_lot_path(:id => 123)
        expect(response.status).to be(404)
        lot_response = JSON.parse(response.body, symbolize_names: true)

        expect(lot_response[:message]).to include('Couldn\'t find Lot with \'id\'=123')
      end
    end

  end
end