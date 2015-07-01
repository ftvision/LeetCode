# @param {Integer} x
# @return {Boolean}
def is_palindrome(x)
    return false if x<0
    tmp, y = x, 0
    while tmp > 0
        y = y * 10 + tmp % 10;
        tmp /= 10
    end
    return x === y
end