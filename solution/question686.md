---
title: Question 686
category: [Data Structure]
tags: [String]
---

![Description](../Assets/Figure/questio686.png)

## Algorithm

- 这个题目因为是**easy**难度的，所以应该不会很难。
- 我总觉得这个题目最优解是写KMP，但是我实在是写不出来，结果发现直接暴力写竟然能够过，而且还特别快。Python也是厉害。

## Comment

- 没有什么很特别的

## Code

```python
class Solution(object):
    def repeatedStringMatch(self, A, B):
        """
        :type A: str
        :type B: str
        :rtype: int
        """
        n, m = len(A), len(B)

        A = A * m
        loc = A.find(B)


        if loc == -1:
            return -1
        else:
            finish = loc + m
            rep = int(finish / n)
            if finish % n > 0:
                rep = rep + 1
        return rep
```
