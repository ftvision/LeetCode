# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @return {Integer[]}
def postorder_traversal(root)
    return !root.nil? ?  postorder_traversal(root.left) + postorder_traversal(root.right) + [root.val] : [] 
end