---
title: Question 453
category: [Algorithm]
tags: [Math]
---

![Description](../Assets/Figure/questio453.png)

## Algorithm

- 这是一道数学题
- 最终所有的数要变成同一个数，比如'X'，需要转换的次数是数列中最小的数`min(nums)`与`X`的距离，所以最小可行的`X`就是解
- 假设我们有`k`步，那么所有的数字的和变成了`X*n`，而每一次变化，数列的和都增长`N-1`，那么就有
- `sum + k * (n - 1) = x * n = (min + k) * n` -> `k = sum - min * n`

## Comment

- 非常基本的题目

## Code

```python
class Solution(object):
    def minMoves(self, nums):
        return sum(nums) - len(nums) * min(nums)
```
