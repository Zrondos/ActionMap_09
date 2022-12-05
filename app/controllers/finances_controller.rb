# frozen_string_literal: true

class FinancesController < ApplicationController
  def initialize
    @uri = 'https://api.propublica.org'
    @url = URI.parse(@uri)
    super
  end

  def index
    # @finances = Finance.all
    @category_list = ['Candidate Loan',
                      'Contribution Total',
                      'Debts Owed',
                      'Disbursements Total',
                      'End Cash',
                      'Individual Total',
                      'PAC Total',
                      'Refund Total']
    @cycle_list = %w[2010 2012 2014 2016 2018 2020]
  end

  def search
    result = api_results
    return if result.nil?

    @finances = Finance.campaign_finance_api_to_finance_params(result)
    @table = []
    @finances.each do |finance|
      category_val = '$'
      category_val += finance.read_attribute(@category.gsub('-', '_')).to_s
      row = [finance.name, category_val]
      @table.push(row)
    end
    render 'finances/search'
  end

  def api_results
    @cycle = params[:cycle][0]
    @category_name = params[:category][0]
    @category = Finance.get_category(@category_name)
    if !@category.nil? && !@cycle.empty?
      http = Net::HTTP.new(@url.host, '443')
      http.use_ssl = true
      uri_temp = "https://api.propublica.org/campaign-finance/v1/#{@cycle}/candidates/leaders/#{@category}.json"
      result, _data = http.get(uri_temp, 'x-api-key' => 'BDfqKXZfoJakFhcim5KU0NtCOUCwFXrxkaGmrL4O')
      result = JSON.parse(result.body, object_class: OpenStruct)
    elsif @category.nil? && @cycle.empty?
      redirect_to finances_path, alert: 'Please select a cycle and category'
    elsif @category.nil?
      redirect_to finances_path, alert: 'Please select a category'
    else
      redirect_to finances_path, alert: 'Please select a cycle'
    end
    result
  end
end
