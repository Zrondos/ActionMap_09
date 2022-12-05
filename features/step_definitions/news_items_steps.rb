# frozen_string_literal: true

Given /the following states exist/ do |states_table|
  states_table.hashes.each do |state|
    State.create state
  end
end

Given /the following counties exist/ do |counties_table|
  counties_table.hashes.each do |county|
    County.create county
  end
end

Given /the following events exist/ do |events_table|
  events_table.hashes.each do |event|
    Event.create event
  end
end
