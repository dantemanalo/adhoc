class PolicyType < ApplicationRecord
  self.table_name = "giis_policy_type"
  self.primary_key = "line_cd"

  alias_attribute :description, :type_desc

  belongs_to :policy, foreign_key: :line_cd
end
