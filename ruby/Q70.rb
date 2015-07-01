# @param {Integer} n
# @return {Integer}
def climb_stairs(n)
    f = [0,1,2] #0,1,2 steps
    iter = 3
    while iter <= n do
        f[iter] = f[iter - 1] + f[iter - 2]
        iter += 1
    end;
    return f[n]
end