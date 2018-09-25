class Assured < ApplicationRecord

  self.table_name = "giis_assured"
	self.primary_key = "assd_no"

	alias_attribute :number, :assd_no
	alias_attribute :name, :assd_name
  alias_attribute :f_name, :first_name
  alias_attribute :m_initial, :middle_initial
  alias_attribute :l_name, :last_name

  has_many :policies, foreign_key: :assd_no
  has_many :claims, foreign_key: :assd_no
  belongs_to :expiry, foreign_key: :assd_no
end
