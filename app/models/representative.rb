# frozen_string_literal: true

class Representative < ApplicationRecord
  has_many :news_items, dependent: :delete_all

  def self.get_address(rep)
    rep = rep.attributes.symbolize_keys
    fields = [
    :locationName,
    :locationLine1,
    :locationLine2,
    :locationLine3
    ]
    address_hash = {}
  # address_hash = { :city_state_zip => "#{rep[:city]}, #{rep[:state]} #{rep[:zip]}" }
  fields.each do |field|
    if rep[field] != nil
    address_hash[field] = rep[field]
    end
  end
  if rep[:city] != nil
  address_hash[:city_state_zip] = "#{rep[:city]}, #{rep[:state]} #{rep[:zip]}"
  end
  address_hash
end

  def self.civic_api_to_representative_params(rep_info)
    reps = []

    rep_info.officials.each_with_index do |official, index|
      ocdid_temp = ''
      title_temp = ''

      rep_info.offices.each do |office|
        if office.official_indices.include? index
          title_temp = office.name
          ocdid_temp = office.division_id
        end
      end

      rep = Representative.find_or_create_by({ name: official.name, ocdid: ocdid_temp,
      title: title_temp })
      reps.push(rep)
    end
    reps
  end

  def self.create_address(address)
    address_hash = {}
    unless address.nil?
      address = address[0]
      address_hash = {
        location_name:  address.location_name,
        location_line1: address.line1,
        location_line2: address.line2,
        location_line3: address.line3,
        city:           address.city,
        zip:            address.zip,
        state:          address.state
      }
    end
    address_hash
  end

  def self.create_representative(official, title, ocdid, address_hash)
    Representative.create!({ name: official.name, ocdid: ocdid,
          title: title,
          locationName: address_hash[:location_name],
          locationLine1: address_hash[:location_line1],
          locationLine2: address_hash[:location_line2],
          locationLine3: address_hash[:location_line3],
          city: address_hash[:city],
          state: address_hash[:state],
          zip: address_hash[:zip],
          photoUrl: official.photo_url,
          party: official.party })
  end
end
