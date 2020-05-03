def valid?(n)
  return false unless n.is_a?(Integer)
  return false if n < 1 || n > 9
  true
end

def password(n)
  return nil unless valid?(n)
  n ** 3 
end

puts password(2) == 8
puts password(1) == 1
puts password(0) == nil
puts password(9) == 729
puts password(10) == nil
puts password("a") == nil