class OpenPolicy < ApplicationRecord
  self.table_name = "gipi_open_policy"
	self.primary_key = "policy_id"

  alias_attribute :linecode, :line_cd
  alias_attribute :sublinecode, :op_subline_cd
  alias_attribute :issuecode, :op_iss_cd
  alias_attribute :issueyear, :op_issue_yy
  alias_attribute :polseqno, :op_pol_seqno
  alias_attribute :renewno, :op_renew_no

  has_many :policies, foreign_key: :policy_id, primary_key: :policy_id

  def self.mop_search(linecode, sublinecode, issuecode, issueyear, polseqno, renewno)
    where(linecode: linecode, sublinecode: sublinecode, issuecode: issuecode, issueyear: issueyear, polseqno: polseqno, renewno: renewno)
    # + where(policy.effectivity_search_date(from_date, to_date))
  end

  def mop_no
    "#{linecode}-#{sublinecode}-#{issuecode}-#{issueyear}-#{proper_seq_no}-#{proper_renew_number}"
  end

  def endorsement_no
    "#{endt_iss_cd}-#{endt_yy}-#{endorsement_sequence}" if endt_seq_no?
  end

  def proper_seq_no
    sprintf '%07d', polseqno
  end

  def proper_renew_number
    sprintf '%02d', renewno
  end

  def endorsement_sequence
    sprintf '%07d', endt_seq_no
  end
end
