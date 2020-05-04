def valid?(n, b_arr)
  return false unless n.is_a?(Integer)
  return false unless b_arr.is_a?(Array)
  return false unless b_arr.all?{|obj| obj.is_a?(Integer)}
  return false if n < 2 || n > 100
  return false if b_arr.any?{|num| num < 0 || num > 10**5}
  return false if n != b_arr.size + 1 
  true
end

def value(n, b_arr)
  return nil unless valid?(n, b_arr)
  a_arr = [b_arr[0]]
  (n - 2).times{|i| a_arr << [b_arr[i],b_arr[i+1]].min}
  a_arr << b_arr[-1]
  p a_arr.sum
end

#test
puts value(3, [2, 5]) == 9
puts value(2, [3]) == 6
puts value(6, [0, 153, 10, 10, 23]) == 53
puts value(1, [0]) == nil
puts value(100, [1]*99) == 100
puts value(101, [1]*100) == nil
puts value(2, [-1]) == nil
puts value(2, [10**5]) == 2*10**5
puts value(2, [10**6]) == nil
puts value(2, [10, 20]) == nil
puts value(2, 10) == nil
puts value("a", [10]) == nil
puts value(2, ["a"]) == nil
#all true