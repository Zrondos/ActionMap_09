# frozen_string_literal: true

class Finance < ApplicationRecord
  def self.campaign_finance_api_to_finance_params(finance_info)
    finances = []
    finance_info.results.each_with_index do |candidate, _index|
      candidate = Finance.find_or_create_by({ name:                candidate.name,
                                              total_contributions: candidate.total_contributions })
      finances.push(candidate)
    end
    finances
  end
end
