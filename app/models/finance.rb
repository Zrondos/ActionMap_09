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
    cycle = finance_info.cycle
    finances = []
    finance_info.results.each do |candidate|
      candidate = if Finance.exists?({ relative_uri: candidate.relative_uri, cycle: cycle })
                    Finance.find_by({ relative_uri: candidate.relative_uri, cycle: cycle })
                  else
                    create_finance(candidate, cycle)
                  end
      finances.push(candidate)
    end
    finances
  end

  def self.create_finance(candidate, cycle)
    Finance.create!(
      { name:                candidate.name,
        relative_uri:        candidate.relative_uri,
        cycle:               cycle,
        candidate_loan:      candidate.candidate_loan,
        contribution_total:  candidate.contribution_total,
        debts_owed:          candidate.debts_owed,
        disbursements_total: candidate.disbursements_total,
        end_cash:            candidate.end_cash,
        individual_total:    candidate.individual_total,
        pac_total:           candidate.pac_total,
        receipts_total:      candidate.receipts_total,
        refund_total:        candidate.refund_total }
    )
  end
end
