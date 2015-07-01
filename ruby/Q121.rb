# @param {Integer[]} prices
# @return {Integer}
def max_profit(prices)
    min = prices[0]
    ans = 0
    prices.each {|x|
        ans = x - min if ans < x - min
        min = x if min > x
    }
    return ans
end