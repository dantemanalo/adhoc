class Claim < ApplicationRecord
  self.table_name = "gicl_claims"
  self.primary_key = "claim_id"

  alias_attribute :paid, :loss_pd_amt
  alias_attribute :reserve, :loss_res_amt
  alias_attribute :file_date, :clm_file_date

  alias_attribute :linecode, :line_cd
  alias_attribute :sublinecode, :subline_cd
  alias_attribute :issuecode, :iss_cd
  alias_attribute :issueyear, :issue_yy
  alias_attribute :polseqno, :pol_seq_no
  alias_attribute :renewno, :renew_no

  belongs_to :assured, foreign_key: :assd_no
  belongs_to :line, foreign_key: :line_cd
end
