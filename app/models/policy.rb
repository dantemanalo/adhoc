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

  belongs_to :assured, foreign_key: :assd_no

  has_one :invoice, foreign_key: :policy_id
  has_many :invoice_taxes, through: :invoice

  def policy_no
    "#{line_cd}-#{subline_cd}-#{iss_cd}-#{issue_yy}-#{pol_seq_no}-#{renew_no}"
  end
end
