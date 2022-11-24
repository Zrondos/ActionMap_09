# frozen_string_literal: true

require 'rails_helper'
require 'google/apis/civicinfo_v2'
require 'ostruct'
require 'json'

RSpec.describe Representative, type: :model do
  describe 'civic_api_to_representative_params method' do
    it 'does not create representative records that already exist' do
<<<<<<< HEAD
      result = eval(File.read('spec/models/representative_stub.txt'))
      result = OpenStruct.new(JSON.parse(result.to_json, object_class: OpenStruct))
      @representatives = described_class.civic_api_to_representative_params(result)
      @representatives2 = described_class.civic_api_to_representative_params(result)
=======
      sample_api_res = eval(File.read('spec/models/representative_stub.txt'))
      sample_api_res_serialized_obj = OpenStruct.new(JSON.parse(sample_api_res.to_json, object_class: OpenStruct))
      @representatives = described_class.civic_api_to_representative_params(sample_api_res_serialized_obj)
      @representatives2 = described_class.civic_api_to_representative_params(sample_api_res_serialized_obj)
>>>>>>> 8a81fd7537e1b327ddaf4bbaa73f9c606f734c8a
      count = 0
      @representatives2.each do |rep|
        count += 1 if rep.name == 'Kamala D. Harris'
      end
      expect(count).to eq 1
    end
  end
end
