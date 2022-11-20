# frozen_string_literal: true

require 'rails_helper'
require 'google/apis/civicinfo_v2'
require 'ostruct'
require 'json'

RSpec.describe Representative, type: :model do
  describe 'civic_api_to_representative_params method' do
    it 'does not create representative records that already exist' do
      result = eval(File.read('spec/models/representative_stub.txt'))
      result = OpenStruct.new(JSON.parse(result.to_json, object_class: OpenStruct))
      @representatives = described_class.civic_api_to_representative_params(result)
      @representatives2 = described_class.civic_api_to_representative_params(result)
      count = 0
      @representatives2.each do |rep|
        count += 1 if rep.name == 'Kamala D. Harris'
      end
      expect(count).to eq 1
    end
  end
end
