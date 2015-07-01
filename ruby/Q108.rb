# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {Integer[]} nums
# @return {TreeNode}
def sorted_array_to_bst(nums)
    return TreeNode.new(nums[0]) if nums.length === 1
    return nil if nums.length === 0
    root = TreeNode.new(nums[nums.length/2])
    root.left = sorted_array_to_bst(nums[0..nums.length/2 - 1])
    root.right = sorted_array_to_bst(nums[nums.length/2 + 1, nums.length - 1])
    return root
end