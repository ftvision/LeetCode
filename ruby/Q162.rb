# @param {Integer[]} nums
# @return {Integer}
def find_peak_element(nums)
    nums = [-(1 << 32)] + nums + [-(1 << 32)]
    for i in 1...nums.length
        if nums[i] > nums[i-1] && nums[i] > nums[i+1] 
            return i - 1
        end
    end
end

#O(logN)
def find_peak_element(nums)
    nums = [-(1 << 32)] + nums + [-(1 << 32)]
    l, r = 1, nums.length - 1
    while l<=r do
        mid = (l+r) / 2
        return mid - 1 if nums[mid] > nums[mid - 1] && nums[mid] > nums[mid + 1]
        l = mid + 1 if nums[mid] > nums[mid - 1] && nums[mid + 1] > nums[mid]
        r = mid - 1 if nums[mid] < nums[mid - 1] && nums[mid + 1] < nums[mid] 
        l = mid + 1 if nums[mid] < nums[mid - 1] && nums[mid + 1] > nums[mid]
    end
end