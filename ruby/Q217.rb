# @param {Integer[]} nums
# @return {Boolean}
def contains_duplicate(nums)
    hash = {}
    nums.each {|x| 
        return true if hash[x] != nil
        hash[x] = 1
    }
    return false
end


# @param {Integer[]} nums
# @return {Boolean}
def contains_duplicate(nums)
    return nums.size != nums.uniq.size
end
