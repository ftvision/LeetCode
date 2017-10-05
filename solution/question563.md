---
title: Question 563
category: [Data Structure]
tags: [Binary Tree]
---

![Description](../Assets/Figure/questio563.png)

## Algorithm

- 非常基本，直接遍历

## Comment

- 非常基本的题目

## Code

From [StefanPochmann](https://discuss.leetcode.com/topic/60550/o-n-sqrt-n-solution)

```python
class Solution(object):
    def findTilt(self, root):
        """
        :type root: TreeNode
        :rtype: int
        """
        def get_sum(root):
            if not root:
                return 0, 0
            else:
                l_sum_cum, l_sum = get_sum(root.left)
                r_sum_cum, r_sum = get_sum(root.right)
                root_cum_sum = l_sum_cum + r_sum_cum + abs(l_sum - r_sum)
                root_sum = l_sum + r_sum + root.val
                return root_cum_sum, root_sum
        ans, _ = get_sum(root)
        return ans
```
