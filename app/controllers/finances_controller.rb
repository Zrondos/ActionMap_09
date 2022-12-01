# frozen_string_literal: true
 
class FinancesController < ApplicationController
  def index
    # @finances = Finance.all
    @category_list = ['Candidate Loan',
                      'Contribution Total',
                      'Debts Owed',
                      'Disbursements Total',
                      'End Cash',
                      'Individual Total',
                      'PAC Total',
                      'Receipts Total',
                      'Refund Total']
    @cycle_list = %w[2010 2012 2014 2016 2018 2020]
  end
  
  def search
    cycle = params[:cycle][0]
    category = params[:category][0]
    category = Finance.get_category(category)
    if !(category.nil?) && !(cycle.empty?)
      @cyc = cycle
      @cat = category
      uri = 'https://api.propublica.org'
      url = URI.parse(uri)
      port = '443'
      http = Net::HTTP.new(url.host, port)
      http.use_ssl = true
      uri = "https://api.propublica.org/campaign-finance/v1/#{cycle}/candidates/leaders/#{category}.json"
      result, _data = http.get(uri, 'x-api-key' => 'BDfqKXZfoJakFhcim5KU0NtCOUCwFXrxkaGmrL4O')
      Rails.logger.debug result.body
      result = JSON.parse(result.body, object_class: OpenStruct)
      @finances = Finance.campaign_finance_api_to_finance_params(result)
      render 'finances/search'
    elsif category.nil? && cycle.empty?
      redirect_to finances_path, alert: 'Please select a cycle and category'
    elsif category.nil?
      redirect_to finances_path, alert: 'Please select a category'
    elsif cycle.empty?
      redirect_to finances_path, alert: 'Please select a cycle'
    end
  end
 end
 