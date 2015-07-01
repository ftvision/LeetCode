# @param {Integer} n
# @return {String[]}
def generate_parenthesis(n)
   f = [[""],["()"]];
   for x in 2..n
        puts x
        f[x] = []
        for i in 0..(x-1)
            puts i 
            tmp1 = f[x-i-1].map{|a| a = "("+a+")"}
            puts tmp1
            tmp2 = f[i]
            puts tmp2
            tmp1.each{|a| tmp2.each{|b| f[x] += [a + b] }}
        end;
   end
   return f[n]         
end