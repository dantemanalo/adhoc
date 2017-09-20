class ProdAccountingEntry < ApplicationRecord

  self.table_name = "giis_assured"
	self.primary_key = "assd_no"

	alias_attribute :assd_num, :assd_no
	alias_attribute :assd_nam, :assd_name

end
