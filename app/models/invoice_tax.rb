class InvoiceTax < ApplicationRecord

  self.table_name = "gipi_inv_tax"
	self.primary_key = "prem_seq_no"

	alias_attribute :iss_code, :iss_cd
  alias_attribute :tax_code, :tax_cd
  alias_attribute :tax_amount, :tax_amt

  belongs_to :invoice, foreign_key: :prem_seq_no
  # belongs_to :invoice, foreign_key: :iss_cd

  def docstamp
    if self.tax_code == 1 && self.iss_code == self.invoice.iss_code
      then self.tax_amount
    end
  end

  def notstamp
    if self.tax_code == 2 && self.iss_code == self.invoice.iss_code
      then self.tax_amount
    end
  end

  def vat
    if self.tax_code == 3 && self.iss_code == self.invoice.iss_code
      then self.tax_amount
    end
  end

  def pt
    if self.tax_code == 4 && self.iss_code == self.invoice.iss_code
      then self.tax_amount
    end
  end

  def fst
    if self.tax_code == 5 && self.iss_code == self.invoice.iss_code
      then self.tax_amount
    end
  end

  def lgt
    if self.tax_code == 6 && self.iss_code == self.invoice.iss_code
      then self.tax_amount
    end
  end

  def notfee
    if self.tax_code == 7 && self.iss_code == self.invoice.iss_code
      then self.tax_amount
    end
  end

  def ot
    if self.tax_code == 8 && self.iss_code == self.invoice.iss_code
      then self.tax_amount
    end
  end

  def docinv
    if self.tax_code == 21 && self.iss_code == self.invoice.iss_code
      then self.tax_amount
    end
  end

  def invrat
    if self.tax_code == 22 && self.iss_code == self.invoice.iss_code
      then self.tax_amount
    end
  end

  def servfee
    if self.tax_code == 23 && self.iss_code == self.invoice.iss_code
      then self.tax_amount
    end
  end

  def cocvf
    if self.tax_code == 29 && self.iss_code == self.invoice.iss_code
      then self.tax_amount
    end
  end

end
