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
                      'Refund Total']
    @cycle_list = %w[2010 2012 2014 2016 2018 2020]
  end

  def search
    cycle = params[:cycle][0]
    @cyc = cycle
    category = params[:category][0]
    @cat = category
    category = Finance.get_category(category)
    if !(category.nil?) && !(cycle.empty?)
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
      Rails.logger.debug @finances
      @table = []

      for finance in @finances do
        puts finance.attributes
        puts finance.methods
        category_val = '$' + finance.read_attribute(category+"?").to_s
        row = [finance.name, category_val]
        @table.push(row)
      end
      
      # for finance in @finances do
      #   category_val = '$'
      #   finance.read_attribute(category)

      #   if category == 'candidate-loan'
      #     category_val += finance.candidate_loan.to_s

      #   elsif category == 'contribution-total'
      #     category_val += finance.contribution_total.to_s

      #   elsif category == 'debts-owed'
      #     category_val += finance.debts_owed

      #   elsif category == 'disbursements-total'
      #     category_val += finance.disbursements_total.to_s

      #   elsif category == 'end-cash'
      #     category_val += finance.end_cash.to_s

      #   elsif category == 'individual-total'
      #     category_val += finance.individual_total.to_s

      #   elsif category == 'pac-total'
      #     category_val += finance.pac_total.to_s

      #   elsif category == 'refund-total'
      #     category_val += finance.refund_total.to_s
      #   end

      #   row = [finance.name, category_val]

      #   @table.push(row)
      # end
      
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
