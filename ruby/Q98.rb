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
def check(root)
    return [true, nil, nil] if root.nil?
    bool_l, min_l, max_l = check(root.left)
    bool_r, min_r, max_r = check(root.right)
    check_left = (root.left.nil?) || (max_l < root.val) ? true : false
    check_right = (root.right.nil?) || (min_r > root.val) ? true : false
    bool = bool_l && bool_r && check_left && check_right
    min = root.left.nil? ? root.val : min_l
    max = root.right.nil? ? root.val : max_r
    return [bool, min, max]
end
def is_valid_bst(root)
    bool, min, max = check(root)
    return bool
end