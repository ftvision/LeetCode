# @param {Integer[]} digits
# @return {Integer[]}
def plus_one(digits)
    digits[digits.length - 1] += 1
    tmp = 0
    (digits.length - 1).downto(0) {|x|  digits[x] += tmp; tmp = digits[x] / 10; digits[x] = digits[x] % 10; puts digits[x]}
    digits.insert(0, tmp) if tmp > 0
    return digits
end