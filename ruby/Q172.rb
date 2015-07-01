# @param {Integer} n
# @return {Integer}
def trailing_zeroes(n)
    ans = 0;
    while n > 0
        ans += n/5
        n /= 5
    end;
    return ans
end