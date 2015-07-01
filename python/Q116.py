# Definition for binary tree with next pointer.
# class TreeLinkNode:
#     def __init__(self, x):
#         self.val = x
#         self.left = None
#         self.right = None
#         self.next = None

class Solution:
    # @param root, a tree link node
    # @return nothing
    def connect(self, root):
        if root != None:
            ans = [root]
        else:
            ans = []
        while len(ans) > 0:
            for i in range(1,len(ans)):
                ans[i-1].next = ans[i]
            tmp = [];
            for node in ans:
                if node.left != None:
                    tmp = tmp + [node.left]
                if node.right != None:
                    tmp = tmp + [node.right]
            ans = tmp

#O(1) in space
class Solution:
    # @param root, a tree link node
    # @return nothing
    def connect(self, root):
        while root:
            travel = root
            while travel:
                if travel.left:
                    travel.left.next = travel.right
                if travel.right and travel.next:
                    travel.right.next = travel.next.left
                travel = travel.next
            root = root.left 