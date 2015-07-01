# @param {Integer} n, a positive integer
# @return {Integer}
def hamming_weight(n)
    ans = 0;
    while n > 0 do
        ans += n & 1
        n >>= 1
    end
    return ans
end