module ProdAccountingEntriesHelper
  def currency(amount)
    if amount.present?
      number_to_currency(amount, unit: '')
    else
      "-"
    end
  end
end
