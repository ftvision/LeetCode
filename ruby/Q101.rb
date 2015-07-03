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
def is_symmetric(root)
    def check_two(tree_l, tree_r)
        return true if tree_l.nil? and tree_r.nil?
        return false if tree_l.nil? ^ tree_r.nil?
        return false if tree_l.val != tree_r.val
        return check_two(tree_l.left, tree_r.right) && check_two(tree_r.left, tree_l.right)
    end
    return check_two(root, root)
end