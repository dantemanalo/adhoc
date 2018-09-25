class ParHistory < ApplicationRecord
  self.table_name = "gipi_parhist"
  self.primary_key = "par_id"

  alias_attribute :status_code, :parstat_cd
  alias_attribute :status_date, :parstat_date
  alias_attribute :name, :user_id

  belongs_to :policy, foreign_key: :par_id
end
