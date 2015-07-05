# @param {Integer[]} nums
# @return {Integer}
def remove_duplicates(nums)
    top = -1;
    nums.each {|x|
        top += 1
        nums[top] = x
        top -= 1 if (top > 1) && (nums[top] === nums[top - 2])
    }
    return nums.empty? ? 0 : top+1
end