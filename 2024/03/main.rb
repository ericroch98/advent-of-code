content = File.read('input.txt')

# use scan instead of match, because match only returns first match
result = 0
content.scan(/mul\(\d{1,3},\d{1,3}\)+/).each do |match|
  x, y = match.scan(/\d{1,3}/)
  result += x.to_i * y.to_i
end
p result
