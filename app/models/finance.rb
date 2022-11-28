# frozen_string_literal: true

class Finance < ApplicationRecord
  def self.get_category(category)
    category_hash = {
      'Candidate Loan'      =>	'candidate-loan',
      'Contribution Total'  => 'contribution-total',
      'Debts Owed'	         => 'debts-owed',
      'Disbursements Total' =>	'disbursements-total',
      'End Cash'	           => 'end-cash',
      'Individual Total'	   => 'individual-total',
      'PAC Total'	          => 'pac-total',
      'Receipts Total'	     => 'receipts-total',
      'Refund Total'	       => 'refund-total'
    }
    category_hash[category]
  end

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
