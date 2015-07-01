# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
def find_kth_largest(nums, k)
    return nums.sort.reverse[k-1]
end

# Binary Search
def find_kth_largest(nums, k)
    min, max = nums[0], nums[0]
    nums.each {|x| 
        min = [min, x].min
        max = [max, x].max
    }
    while min <= max 
        mid = (min + max) / 2
        count = 0;
        nums.each{|x| count += 1 if x >= mid}
        if count >= k
            min = mid + 1
        else
            max = mid - 1
        end
    end
    return max
end