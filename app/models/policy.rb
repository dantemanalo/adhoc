class Policy < ApplicationRecord

  self.table_name = "gipi_polbasic"
	self.primary_key = "policy_id"

	alias_attribute :iss_date, :issue_date
  alias_attribute :line_code, :line_cd
  alias_attribute :subline_code, :subline_cd
  alias_attribute :iss_code, :iss_cd
  alias_attribute :iss_year, :issue_yy
  alias_attribute :pol_sequence_no, :pol_seq_no
  alias_attribute :renewal_no, :renew_no
  alias_attribute :tsi_amount, :tsi_amt
  alias_attribute :prem_amount, :prem_amt
  alias_attribute :accounting_entry_date, :acct_ent_date
  alias_attribute :spoiled_acct_ent_date, :spld_acct_ent_date
  alias_attribute :crediting_branch, :cred_branch

  has_one :invoice, foreign_key: :policy_id
  has_many :invoice_taxes, through: :invoice
  belongs_to :assured, foreign_key: :assd_no

  def policy_no
    "#{line_cd}-#{subline_cd}-#{iss_cd}-#{issue_yy}-#{pol_seq_no}-#{renew_no}"
  end

  def self.accounting_entry_search_date(start_date, end_date)
    Policy.where(accounting_entry_date: start_date..end_date).or(Policy.where(spoiled_acct_ent_date: start_date..end_date)).includes(:invoice, :invoice_taxes, :assured).order('iss_cd','line_cd', 'subline_cd', 'issue_yy', 'pol_seq_no','renew_no')
  end
end
