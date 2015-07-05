# @param {Integer[]} nums
# @return {Integer}
def remove_duplicates(nums)
    top = 0;
    nums.each {|x|
        if x != nums[top] 
            top += 1
            nums[top] = x
        end
    }
    return nums.empty? ? 0 : top+1
end