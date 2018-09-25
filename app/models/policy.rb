class Policy < ApplicationRecord

  self.table_name = "gipi_polbasic"
	self.primary_key = "policy_id"

	alias_attribute :iss_date, :issue_date
  alias_attribute :linecode, :line_cd
  alias_attribute :sublinecode, :subline_cd
  alias_attribute :issuecode, :iss_cd
  alias_attribute :issueyear, :issue_yy
  alias_attribute :polseqno, :pol_seq_no
  alias_attribute :renewno, :renew_no
  alias_attribute :tsi_amount, :tsi_amt
  alias_attribute :prem_amount, :prem_amt
  alias_attribute :accounting_entry_date, :acct_ent_date
  alias_attribute :spoiled_acct_ent_date, :spld_acct_ent_date
  alias_attribute :crediting_branch, :cred_branch
  alias_attribute :policyflag, :pol_flag
  alias_attribute :distributionflag, :dist_flag
  alias_attribute :endorsement_iss_cd, :endt_iss_cd
  alias_attribute :endorsement_year, :endt_yy
  alias_attribute :endorsement_seq_no, :endt_seq_no
  alias_attribute :month, :booking_mth
  alias_attribute :year, :booking_year

  alias_attribute :region, :region_cd
  alias_attribute :take_up_term, :takeup_term
  alias_attribute :inceptdate, :incept_date
  alias_attribute :expirydate, :expiry_date
  alias_attribute :issuedate, :issue_date
  alias_attribute :effectivitydate, :eff_date
  alias_attribute :endtexpirydate, :endt_expiry_date
  alias_attribute :ref_policy_no, :ref_pol_no
  alias_attribute :number, :assd_no
  alias_attribute :reg_pol_switch, :reg_policy_sw

  scope :not_spoiled, -> {where.not(policyflag: ['4', '5', 'X'])}

  has_one :invoice, foreign_key: :policy_id
  has_many :invoice_taxes, through: :invoice

  belongs_to :assured, foreign_key: :assd_no
  has_many :claims, through: :assured, foreign_key: :assd_no

  has_one :commission_invoice, foreign_key: :policy_id
  has_one :intermediary, through: :commission_invoice, foreign_key: :intm_no
  has_one :policy_type, foreign_key: :line_cd

  has_one :policy_distribution, foreign_key: :policy_id
  has_one :line, foreign_key: :line_cd, primary_key: :line_cd
  has_many :old_taxes, foreign_key: :policy_id
  has_many :new_taxes, foreign_key: :policy_id
  has_many :old_peril_groups, foreign_key: :policy_id
  has_many :endorsements, foreign_key: :policy_id
  has_many :items, foreign_key: :policy_id
  has_many :item_perils, through: :items, foreign_key: :policy_id
  has_many :par_history, foreign_key: :par_id
  has_one :region_name, foreign_key: :region_cd, primary_key: :region_cd
  has_one :issuesource, foreign_key: :iss_cd, primary_key: :iss_cd
  belongs_to :expiry, foreign_key: :policy_id
  belongs_to :open_policy, foreign_key: :policy_id

  BOOKING_MONTHS = ['JANUARY', 'FEBRUARY', 'MARCH', 'APRIL', 'MAY', 'JUNE', 'JULY', 'AUGUST', 'SEPTEMBER', 'OCTOBER', 'NOVEMBER', 'DECEMBER']

  BOOKING_YEARS = (2004..Date.today.year).to_a.reverse

  def policy_no
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

  def self.accounting_entry_search_date(start_date, end_date)
    if start_date.present?
      policies = self.where(accounting_entry_date: start_date..end_date).or(self.where(spoiled_acct_ent_date: start_date..end_date))
    else
      policies = self.where(accounting_entry_date: Time.now.beginning_of_month..Time.now).or(self.where(spoiled_acct_ent_date: Time.now.beginning_of_month..Time.now))
    end
    policies.includes(:commission_invoice, :intermediary, :invoice, :invoice_taxes, :assured)
    #.order('iss_cd','line_cd', 'subline_cd', 'issue_yy', 'pol_seq_no','renew_no')
  end

  def self.search_by_assured(number)
    if number.present?
      self.where(number: number)
    else
      self.where(number)
    end
  end

  def complete_address
    "#{address1} #{address2}"
  end

  def booking_date
    "#{booking_mth} #{booking_year}"
  end

  def self.search_by_booking_date(month, year)
    #booking = month + ' '  + year
    #where("to_date(booking_mth||' '||booking_year, 'MONTH YYYY') <= ?", booking)
    #where(month: month, year: year)
    where("booking_mth <= ? and booking_year <= ?", month, year)
  end

  def self.to_csv(start_date,end_date)
    attributes = %w{POLICY_NO ASSD_NAME ISSUE_DATE TSI_AMT PREM_AMT ACCT_ENT_DATE}
    CSV.generate(headers: true) do |csv|
      csv << attributes

      Policy.accounting_entry_search_date(start_date, end_date).each do |pol|
        csv << [pol.policy_no, pol.assured&.name, pol.iss_date, pol.tsi_amount, pol.prem_amount, pol.accounting_entry_date
          # , pol.invoice.invoice_taxes.where(issue_code: pol.invoice.issue_code, line_code: pol.line_code).each do |t|
          #   t.tax_name.name t.tax_amount
          # end
        ]
      end
    end
  end

  def self.search_by_issuedate(start_date, end_date)
    self.where(issuedate: start_date..end_date)
  end

  def self.search_by_line(linecode)
    if linecode.present?
      self.where(linecode: linecode)
    else
      self.where(linecode)
    end
  end

  def self.search_by_branch(issuecode)
      if issuecode.present?
        self.where(issuecode: issuecode)
      else
        self.where(issuecode)
      end
  end
end
