# @param {Integer} n
# @return {Integer[]}
def gray_code(n)
   seq = [0]
   for iter in 0...n
       seq = seq + seq.reverse.map{|x| x + (1 << iter)}
   end;
   return seq
end