# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @return {Integer[][]}
def zigzag_level_order(root)
    return [] if root === nil
    ans = []
    stack, direction = [root], 1
    while stack.length > 0
        tmp_stack, tmp_ans = [], [];
        while stack.length > 0 
            node = stack.pop
            tmp_ans += [node.val]
            subtree = []
            subtree += [node.left] if !node.left.nil?
            subtree += [node.right] if !node.right.nil?
            tmp_stack += direction === 1 ? subtree : subtree.reverse
        end
        direction = direction ^ 1
        stack = tmp_stack
        ans += [tmp_ans]
    end
    return ans     
end