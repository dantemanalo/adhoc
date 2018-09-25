class Issuesource < ApplicationRecord
  self.table_name = "giis_issource"
  self.primary_key = "iss_cd"

  alias_attribute :branchname, :iss_name

  belongs_to :expiry, foreign_key: :iss_cd
  belongs_to :policy, foreign_key: :iss_cd
end
