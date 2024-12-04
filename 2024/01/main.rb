# frozen_string_literal: true

# part 1
left = []
right = []
file = File.open('input.txt', 'r').each do |line|
  first, last = line.split(' ').map(&:to_i)
  left << first
  right << last
end
file.close

left.sort!
right.sort!

result = left.zip(right).map { |a, b| (a - b).abs }
puts(result.sum)

# part 2
result2 = left.map do |a|
  b = right.count(a)
  a * b
end
puts(result2.sum)
