content = File.read('input.txt')

# use scan instead of match, because match only returns first match
result = 0
toggle = true
content.scan(/(mul\(\d{1,3},\d{1,3}\))|(do\(\))|(don't\(\))/).each do |match|
  multiplication, on, off = match
  if toggle == true && !off.nil?
    toggle = false
  elsif toggle == false && !on.nil?
    toggle = true
  end

  if toggle == true && !multiplication.nil?
    x, y = multiplication.scan(/\d{1,3}/)
    result += x.to_i * y.to_i
  end
end
p result
