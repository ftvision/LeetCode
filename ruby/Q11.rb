# @param {Integer[]} height
# @return {Integer}

#O(N^2)
def max_area(height)
    max = 0
    for i in 0...height.length do
        for j in i+1 ... height.length
            max = [height[i],height[j]].min * (j-i-1) if [height[i],height[j]].min * (j-i-1) > max
        end
    end
    return max
end