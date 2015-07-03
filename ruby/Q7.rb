# @param {Integer} x
# @return {Integer}
def reverse(x)
    ans = 0;
    sign = x < 0 ? -1 : 1
    x = x.abs
    while x > 0 
        return 0 if ans > 214748364
        ans = ans * 10 + x % 10;
        x = x / 10
    end;
    ans = ans * sign
    return ans
end