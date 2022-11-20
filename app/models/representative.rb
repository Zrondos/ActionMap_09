# frozen_string_literal: true

class Representative < ApplicationRecord
  has_many :news_items, dependent: :delete_all

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

      rep = if Representative.exists?({ name: official.name, ocdid: ocdid_temp,
        title: title_temp })
              Representative.find_by({ name: official.name, ocdid: ocdid_temp,
              title: title_temp })
            else
              address_hash = create_address(official.address)
              create_representative(official, title_temp, ocdid_temp, address_hash)
            end
      reps.push(rep)
    end
    reps
  end

  def self.create_address(address)
    address_hash = {}
    # byebug
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
