# @param {Integer} n
# @return {Boolean}
def is_power_of_two(n)
    ans = 0
    while n > 0 do ans += n & 1; n = n >> 1; end
    return ans === 1
end

def is_power_of_two(n)
   return n > 0 ? n & (n-1) === 0 : false
end