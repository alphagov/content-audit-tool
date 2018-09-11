module FormatHelper
  include ActionView::Helpers::DateHelper
  include ActionView::Helpers::NumberHelper

  def format_number(number)
    number_with_delimiter(number, delimiter: ",")
  end

  def format_percentage(percentage, precision: 0)
    number_with_precision(
      percentage,
      precision: precision,
      strip_insignificant_zeros: true,
    ) + "%"
  end

  def format_datetime(datetime, relative: true)
    return "Never" unless datetime

    date = datetime.to_date.to_s(:short)
    time_ago = time_ago_in_words(datetime)

    relative ? "#{date} (#{time_ago} ago)" : date
  end

  def format_boolean(boolean)
    boolean ? "Yes" : "No"
  end

  def format_array(array)
    array.any? ? array.join(", ") : "None"
  end
end
