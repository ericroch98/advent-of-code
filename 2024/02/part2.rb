# frozen_string_literal: true

def check_report(data)
  # check if ascending or descending
  return false unless data == data.sort || data == data.sort.reverse

  # check if margin is smaller than 4 and more than 1 for each data
  safe_element = true
  (data.length - 1).times do |index|
    safe_element = false if (data[index] - data[index + 1]).abs > 3 || (data[index] - data[index + 1]).abs.zero?
  end

  safe_element
end

safe_reports = 0
report_array = []
file = File.open('input.txt', 'r').each do |line|
  report_array << line.split(' ').map(&:to_i)
end
file.close

# puts report_array.inspect

report_array.each do |report|
  is_new_report_safe = false
  report.each_index do |index|
    new_report = report.dup
    new_report.delete_at(index)
    is_new_report_safe = true if check_report(new_report) == true
  end
  safe_reports += 1 if is_new_report_safe == true
end

puts(safe_reports)
