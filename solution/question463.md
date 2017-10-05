---
title: Question 463
category: [Algorithm]
tags: [Easy]
---

![Description](../Assets/Figure/questio463.png)

## Algorithm

- 直接for loop就好，对于每一个`grid[i][j] == 1`，看他四边有多少个边界：
  - `grid[i + dx][j + dy] == 00`
  - `[i + dy][j + dy]` 不在棋盘内

## Comment

- 要注意的一点是：如果a.end == b.start，这个时候可以使用a的会议室，而不需要新开会议室。

## Code

```python
class Solution(object):
    def islandPerimeter(self, grid):
        """
        :type grid: List[List[int]]
        :rtype: int
        """
        direction = [(-1,0),(0,1),(0,-1),(1,0)]
        n, m = len(grid), len(grid[0])
        ans = 0
        for i in range(n):
            for j in range(m):
                if grid[i][j]:
                    for dx, dy in direction:
                        if i + dx < 0 or i + dx >= n or j + dy < 0 or j + dy >= m or grid[i + dx][j + dy] == 0:
                            ans = ans + 1
        return ans
```
