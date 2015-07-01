# @param {Integer[]} prices
# @return {Integer}
def max_profit(prices)
    ans = 0;
    prices.each_with_index {|x,ind| ans += prices[ind+1] - prices[ind] if ind < prices.length - 1 && prices[ind+1] > prices[ind]}
    return ans
end

def max_profit(prices)
    ans = 0;
    diff = prices.each_cons(2).map {|a,b| b - a}
    value = diff.select! {|a| a>0}
    value.each {|x| ans+=x }
    return ans
end