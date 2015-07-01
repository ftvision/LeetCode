# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
def search_insert(nums, target)
    left = 0; right = nums.length - 1
    while left <= right do
        mid = (left + right) / 2
        mid_value = nums[mid]
        if mid_value === target
            return mid
        elsif mid_value > target
            right = mid - 1
        else
            left = mid + 1
        end;
    end
    return left
end