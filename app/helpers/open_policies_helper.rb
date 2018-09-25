module OpenPoliciesHelper
  def format_date(date)
    date.strftime('%d %b %Y')
  end

  def format_currency(amount)
    number_to_currency(amount, unit: "")
  end
end
