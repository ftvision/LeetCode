# @param {Integer[]} nums
# @return {Integer}
def max_sub_array(nums)
    ans, min, cumsum = nil,0,0
    nums.each {|x| 
        cumsum = cumsum + x
        ans = ans.nil? ? cumsum - min : [ans, cumsum - min].max
        min = [cumsum, min].min
    }
    return ans
end