# frozen_string_literal: true

Given /I am logged out/ do
  session[:current_user_id] = nil
end
