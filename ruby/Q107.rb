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
def level_order_bottom(root)
    queue = root.nil? ? [] : [root]
    ans = []
    while queue.length > 0 
        level = [];
        queue.each {|x| level += [x.val]}
        ans += [level]
        tmp = [];
        queue.each {|x| 
            tmp += [x.left] if !x.left.nil?
            tmp += [x.right] if !x.right.nil?
        }
        queue = tmp
    end
    return ans.reverse
end
