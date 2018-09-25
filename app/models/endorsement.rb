class Endorsement < ApplicationRecord

  self.table_name = "gipi_endttext"
	self.primary_key = "policy_id"

	alias_attribute :endt_info, :endt_text01

  belongs_to :policy, foreign_key: :policy_id
  
end
