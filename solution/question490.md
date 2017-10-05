---
title: Question 490
category: [Algorithm]
tags: [BFS]
---

![Description](../Assets/Figure/questio490.png)

## Algorithm

- 这个题目就是问存在性的问题，比较直观，直接用BFS就好了。当然也可以用DFS，都没有什么差别

## Comment

- 比较直观的解

## Code


```python
from collections import deque
class Solution(object):
    def hasPath(self, maze, start, destination):
        """
        :type maze: List[List[int]]
        :type start: List[int]
        :type destination: List[int]
        :rtype: bool
        """
        n, m = len(maze), len(maze[0])
        visited = set((start[0], start[1]))
        queue = deque()
        queue.append(start)
        direction = [(-1, 0), (1, 0), (0, 1), (0, -1)]
        while queue:
            state = queue.popleft()
            for dx, dy in direction:
                x, y = state
                while x + dx >= 0 and x + dx < n and y + dy >= 0 and y + dy < m and maze[x + dx][y + dy] == 0:
                    x = x + dx
                    y = y + dy
                if x == destination[0] and y == destination[1]:
                        return True
                if (x, y) not in visited:
                    visited.add((x,y))
                    queue.append((x,y))
        return False
```
