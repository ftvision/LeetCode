---
title: Question 687
category: [Data Structure]
tags: [Binary Tree]
---

![Description](../Assets/Figure/questio687.png)

## Algorithm

- 这个最终还是Tree DP吧，或者说是直接tree search
- 基本思路就是，`best(root) = max(best(root.left), best(root.right), best(path across root))`
  - 但是为了这个`path across root`，我还记录了以每个node为起点的到leave node的最长距离
  - 这样的话，如果`root.val == root.left.val`，那么我们就可以把*从左子树的根到leave的最长路径*加上当前的root形成新的路径；同样的道理可以把右子树加上来。
  - 这样就可以计算出`path across root`的长度，然后比较那种解最优。

## Comment

- 没有什么很特别的

## Code


```python

class Solution(object):
    def longestUnivaluePath(self, root):
        """
        :type root: TreeNode
        :rtype: int
        """
        def search(root):
            if root is None:
                return 0, 0
            l_best, l_single = search(root.left)
            r_best, r_single = search(root.right)
            best = max(l_best, r_best)
            single = 1
            root_best = 1
            if root.left is not None and root.left.val == root.val:
                root_best = root_best + l_single
                single = max(single, l_single + 1)
            if root.right is not None and root.right.val == root.val:
                root_best = root_best + r_single
                single = max(single, r_single + 1)

            best = max(best, root_best)
            return best, single
        if root is None:
            return 0
        ans, _ = search(root)
        return ans - 1
```
