module ApplicationHelper
    def format_date(date)
      date.strftime('%d %b %Y')
    end

    def format_day(date)
      date.strftime("%A")
    end

    def format_currency(amount)
      number_to_currency(amount, unit: "")
    end

    def shorten(string, length)
      truncate(string, length: length)
    end

    def sortable(column, title = nil)
      title ||= column.titleize
      direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
      link_to title, :sort => column, :direction => direction
    end

    def linename(linecode)
      case linecode
        when "MC" then "Motor Car"
        when "FI" then "Fire"
        when "PA" then "Accident"
        when "CA" then "Casualty"
        when "EN" then "Engineering"
        when "CA" then "Casualty"
        when "MN" then "Marine"
        when "SU" then "Surety"
      end
    end
end
