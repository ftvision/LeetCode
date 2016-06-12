# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @param {Integer} k
# @return {Integer}
def kth_smallest(root, k)
    $pos = k
    def dfs(root)
        return nil if root.nil? || $pos < 0
        left_ans = dfs(root.left)
        $pos -= 1
        root_ans = $pos === 0 ? root.val : nil
        right_ans = dfs(root.right)
        return left_ans || root_ans || right_ans
    end
    return dfs(root)
end

#multiple request, each time O(height Tree)
def kth_smallest(root, k)
    $hash_left = {}
    def get_num(root)
        return 0 if root.nil?
        left_num = get_num(root.left);
        right_num = get_num(root.right);
        $hash_left[root] = left_num
        return left_num + 1 + right_num
    end
    get_num(root)
    while k > 0
        return root.val if k === $hash_left[root] + 1
        if k <= $hash_left[root]
            root = root.left
        else
            k = k - 1 - $hash_left[root]
            root = root.right
        end
    end
end