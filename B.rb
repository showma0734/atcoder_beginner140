def valid?(n, a_arr, b_arr, c_arr)
  return false unless n.is_a?(Integer)
  return false unless [a_arr, b_arr, c_arr].all?{|obj| obj.is_a?(Array)}
  return false unless a_arr.all?{|obj| obj.is_a?(Integer)}
  return false unless b_arr.all?{|obj| obj.is_a?(Integer)}
  return false unless c_arr.all?{|obj| obj.is_a?(Integer)}
  return false if n < 2 || n > 20
  return false if n != a_arr.size
  return false if n != b_arr.size
  return false if n != c_arr.size + 1
  return false if a_arr.any?{|num| num < 1 || num > n}
  return false if b_arr.any?{|num| num < 1 || num > 50}
  return false if c_arr.any?{|num| num < 1 || num > 50}
  return false if a_arr != a_arr.uniq
  true
end

def buffet(n, a_arr, b_arr, c_arr)
  return nil unless valid?(n, a_arr, b_arr, c_arr)
  sum = 0
  a_arr.each.with_index do |num, idx|
    sum += b_arr[num-1]
    if a_arr[idx] + 1 == a_arr[idx + 1]
      sum += c_arr[num - 1] 
    end
  end
  sum
end

#test
puts buffet(3, [3, 1, 2], [2, 5, 4], [3, 6]) == 14
puts buffet(4, [2, 3, 4, 1], [13 , 5, 8, 24], [45, 9, 15]) == 74
puts buffet(2, [1, 2], [50, 50], [50]) == 150
puts buffet(1, [5], [50], [nil]) == nil
puts buffet(20, (1..20).to_a, [10]*20, [10]*19) == 390
puts buffet(21, (1..21).to_a, [10]*21, [10]*20) == nil
puts buffet(2, [0, 1], [10, 10], [10]) == nil
puts buffet(2, [1, 2, 3] ,[10, 10], [10]) == nil
puts buffet(2, [1, 2] ,[10, 10, 10], [10]) == nil
puts buffet(2, [1, 2] ,[10, 10], [10, 10]) == nil
puts buffet(2, [1, 2], [0, 10], [10]) == nil
puts buffet(2, [1, 2], [1, 10], [10]) == 21
puts buffet(2, [1, 2] ,[10, 50], [10]) == 70
puts buffet(2, [1, 2] ,[10, 51], [10]) == nil
puts buffet(2, [1, 2] ,[10, 10], [0]) == nil
puts buffet(2, [1, 2] ,[10, 10], [1]) == 21
puts buffet(2, [1, 2] ,[10, 10], [50]) == 70
puts buffet(2, [1, 2] ,[10, 10], [51]) == nil
puts buffet("a", [1, 2], [10, 10], [10]) == nil
puts buffet(2, ["a", 2], [10, 10], [10]) == nil
puts buffet(2, [1, 2], ["a", 10], [10]) == nil
puts buffet(2, [1, 2], [10, 10], ["a"]) == nil
#all true