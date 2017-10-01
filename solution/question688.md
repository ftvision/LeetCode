---
title: Question 688
category: [Algorithm]
tags: [Memorized DP]
---

![Description](../Assets/Figure/questio688.png)

## Algorithm

- 一开始觉得直接每一步算的话，应该会爆时间，感觉状态数太多
- 后来一想反正没时间，不如直接写一个暴力的看看到底多慢
- 结果因为每一次iteration，我memorized走过的位置，所以实际上每次iteration扩展的状态数最多是O(N^2)
- 然后结果暴力做，加上memorized走过的位置，整个时间复杂度其实是O(N^2K)，其实也不是很糟糕

## Comment

- 先用最蠢的方法，然后再加上一点点智能！

## Code


```python
class Solution:
    def knightProbability(self, N, K, r, c):
        """
        :type N: int
        :type K: int
        :type r: int
        :type c: int
        :rtype: float
        """
        move = [(2, 1), (1, 2), (-1, 2), (-2, 1), (-1, -2), (-2, -1), (1, -2),(2, -1)]
        loc = dict()
        loc[(r, c)] = 1
        ans = 1
        for step in range(K):
            visited = dict()
            for pos, prob in loc.items():
                x, y = pos
                for dx, dy in move:
                    if x + dx >= 0 and x + dx < N and y + dy >= 0 and y + dy < N:
                        if (x + dx, y + dy) in visited:
                            visited[(x + dx, y + dy)] = visited[(x + dx, y + dy)] + prob * 1/8
                        else:
                            visited[(x + dx, y + dy)] = prob * 1/8
            loc = visited
            if len(loc) == 0:
                ans = 0
                break
        return sum(prob for pos, prob in loc.items())
```
