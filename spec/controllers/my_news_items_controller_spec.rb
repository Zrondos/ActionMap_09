# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MyNewsItemsController, type: :controller do
  describe 'set variables' do
    it 'sets the issues list' do
      @my_news_items_controller = described_class.new
      @my_news_items_controller.send(:set_issues_list)
      expect(@my_news_items_controller.instance_variable_get(:@issues_list)).not_to be_nil
    end

    it 'sets the representatives list' do
      @my_news_items_controller = described_class.new
      @my_news_items_controller.send(:set_representatives_list)
      expect(@my_news_items_controller.instance_variable_get(:@representatives_list)).not_to be_nil
    end
  end
end
