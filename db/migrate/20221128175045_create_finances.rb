# frozen_string_literal: true

class CreateFinances < ActiveRecord::Migration[5.2]
  def change
    create_table :finances do |t|
      t.string :name
      t.integer :cycle
      t.string :relative_uri
      t.decimal :candidate_loan, precision: 9, scale: 2
      t.decimal :contribution_total, precision: 9, scale: 2
      t.decimal :debts_owed, precision: 9, scale: 2
      t.decimal :disbursements_total, precision: 9, scale: 2
      t.decimal :end_cash, precision: 9, scale: 2
      t.decimal :individual_total, precision: 9, scale: 2
      t.decimal :pac_total, precision: 9, scale: 2
      t.decimal :receipts_total, precision: 9, scale: 2
      t.decimal :refund_total, precision: 9, scale: 2
      t.timestamps null: false
    end
  end
end
