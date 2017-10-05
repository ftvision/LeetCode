---
title: Question 228
category: [Data Structure]
tags: [Stack]
---

![Description](../Assets/Figure/questio228.png)

## Algorithm

- 这个题目已经给出了一个sorted array，所以这就是直接用个stack就好了。

## Comment

- 比较直接

## Code


```python
class Solution(object):
    def summaryRanges(self, nums):
        """
        :type nums: List[int]
        :rtype: List[str]
        """
        if not nums:
            return nums
        ans = [[nums[0], nums[0]]]
        for num in nums[1:]:
            if num == ans[-1][1] + 1:
                ans[-1][1] = num
            else:
                ans.append([num, num])
        char_ans = [str(item[0]) if item[0] == item[1] else "->".join([str(item[0]), str(item[1])]) for item in ans]
        return char_ans
```
