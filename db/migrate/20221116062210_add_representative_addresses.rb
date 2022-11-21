# frozen_string_literal: true

class AddRepresentativeAddresses < ActiveRecord::Migration[5.2]
  def change
    add_column :representatives, :locationName, :string
    add_column :representatives, :locationLine1, :string
    add_column :representatives, :locationLine2, :string
    add_column :representatives, :locationLine3, :string
    add_column :representatives, :city, :string
    add_column :representatives, :state, :string
    add_column :representatives, :zip, :string
  end
end
