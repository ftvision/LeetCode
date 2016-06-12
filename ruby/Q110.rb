# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @return {Boolean}
def is_balanced(root)
    def dfs(root)
        return true, 0 if root.nil?
        bool_l, dep_l = dfs(root.left)
        bool_r, dep_r = dfs(root.right)
        return bool_l && bool_r && (dep_l - dep_r).abs <= 1, [dep_l, dep_r].max + 1
    end
    bool, depth = dfs(root)
    return bool
end
