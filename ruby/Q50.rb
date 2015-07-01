# @param {Float} x
# @param {Integer} n
# @return {Float}
def pow_pos(x, n)
    return 1 if n === 0
    return n % 2 === 1 ? my_pow(x, n / 2) ** 2 * x : my_pow(x, n / 2) ** 2
end
def my_pow(x, n)
    return n >= 0 ? pow_pos(x,n) : 1.0 / pow_pos(x,-n)
end