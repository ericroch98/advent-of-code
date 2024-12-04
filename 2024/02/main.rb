# frozen_string_literal: true

safe_reports = 0
file = File.open('input.txt', 'r').each do |line|
  data = line.split(' ').map(&:to_i)

  # check if ascending or descending
  next unless data == data.sort || data == data.sort.reverse

  # check if margin is smaller than 4 and more than 1 for each data
  safe_element = true
  (data.length - 1).times do |index|
    safe_element = false if (data[index] - data[index + 1]).abs > 3 || (data[index] - data[index + 1]).abs.zero?
  end
  safe_reports += 1 if safe_element == true
end
file.close

puts(safe_reports)
