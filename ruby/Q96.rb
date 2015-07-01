# @param {Integer} n
# @return {Integer}
def num_trees(n)
    iter, f = 1, [1]
    while iter <= n do
        iter.times {|x| f[iter] = f[iter].nil? ? f[x] * f[iter - x - 1] : f[x] * f[iter - x - 1] + f[iter]}
        iter += 1
    end
    return f[n]
end