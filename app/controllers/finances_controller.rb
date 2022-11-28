# frozen_string_literal: true

require 'faraday'

class FinancesController < ApplicationController
  def index
    @finances = Finance.all
  end

  def search
    cycle = params[:cycle]
    category = params[:category]
    # service = Google::Apis::CivicinfoV2::CivicInfoService.new
    # service.key = Rails.application.credentials[:X_API_Key]
    # response = Faraday.get("https://api.propublica.org/campaign-finance/v1/2016/candidates/search.json?query=Wilson")
    # result = service.get_recently_candidates(cycle: cycle, page: 1, service.key)

    uri = 'https://api.propublica.org'
    url = URI.parse(uri)
    port = '443'
    http = Net::HTTP.new(url.host, port)
    http.use_ssl = true
    uri = "https://api.propublica.org/campaign-finance/v1/#{cycle}/candidates/leaders/#{category}.json"
    resp, _data = http.get(uri, 'x-api-key' => 'BDfqKXZfoJakFhcim5KU0NtCOUCwFXrxkaGmrL4O')
    Rails.logger.debug resp.body

    # @finances = Finance.campaign_finance_api_to_finance_params(result)
    render 'finances/search'
  end
end
