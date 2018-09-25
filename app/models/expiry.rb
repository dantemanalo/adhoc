class Expiry < ApplicationRecord
  self.table_name = "giex_expiry"
  self.primary_key = "policy_id"

  alias_attribute :polid, :policy_id
  alias_attribute :expdate, :expiry_date
  alias_attribute :assdnumber, :assd_no
  alias_attribute :renewflag, :renew_flag
  alias_attribute :linecode, :line_cd
  alias_attribute :sublinecode, :subline_cd
  alias_attribute :issuecode, :iss_cd
  alias_attribute :issueyear, :issue_yy
  alias_attribute :polseqno, :pol_seq_no
  alias_attribute :renewno, :renew_no
  alias_attribute :intermediaryno, :intm_no

  has_one :issuesource, foreign_key: :iss_cd, primary_key: :iss_cd
  has_one :line, foreign_key: :line_cd, primary_key: :line_cd
  has_one :assured, foreign_key: :assd_no, primary_key: :assd_no
  has_one :intermediary, foreign_key: :intm_no, primary_key: :intm_no
  has_one :policy, foreign_key: :policy_id, primary_key: :policy_id

  def self.policy_search(linecode, sublinecode, issuecode, issueyear, polseqno, renewno)
    Expiry.where(linecode: linecode, sublinecode: sublinecode, issuecode: issuecode, issueyear: issueyear, polseqno: polseqno, renewno: renewno).order('line_cd', 'subline_cd', 'iss_cd', 'issue_yy', 'pol_seq_no','renew_no')
  end

  def self.search_date(start_date, end_date)
    self.where(expdate: start_date..end_date).includes(:policy).order('expiry_date')
  end

  def self.search_by_branch(branchcode)
      self.where(issuecode: branchcode)
  end

  def self.search_by_intermediary(intermediaryno)
      self.where(intermediaryno: intermediaryno)
  end

  def self.search_by_line(linecode)
      self.where(linecode: linecode)
  end

  def self.search_by_line(linecode)
    if linecode.present?
      self.where(linecode: linecode)
    else
      self.where(linecode)
    end
  end

  def location_of_risk
    "#{loc_risk1} #{loc_risk2} #{loc_risk3}"
  end
end
