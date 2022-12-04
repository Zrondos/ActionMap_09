# frozen_string_literal: true

And /^(?:|I )select "([^"]*)" from cycle_/ do |option|
  select(option, from: @cycle_list)
end

And /^(?:|I )select "([^"]*)" from category_/ do |option|
  select(option, from: @category_list)
end

And /"Cycle" should contain "([^"]*)"$/ do |text|
  expect(page).to have_select(@cycle_list, with_options: [text])
end

And /"Category" should contain "([^"]*)"$/ do |text|
  expect(page).to have_select(@cycle_list, with_options: [text])
end
