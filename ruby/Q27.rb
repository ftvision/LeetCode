# @param {Integer[]} nums
# @param {Integer} val
# @return {Integer}
def remove_element(nums, val)
    return 0 if nums.length === 0
    last = -1
    for i in 0...nums.length 
        if nums[i] != val
            last += 1
            nums[last] = nums[i]
        end
    end
    return last + 1
end