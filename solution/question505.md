---
title: Question 505
category: [Algorithm]
tags: [Cheapest-First Search]
---

![Description](../Assets/Figure/questio505_1.png)
![Description](../Assets/Figure/questio505_2.png)

## Algorithm

- 这个题目理应是cheapest-first search，但是更新Priority Queue的时候一些细节没有能够掌握，所以结果使用了一个很蠢的cheapest first search的方法：就是每次走一步。
- 理论上来说，如果Priority Queue中间的数值可以改变，那么每次更新的时候可以一次性走到底，而不需要每次走一步。
  - 这个写法已经更新了，主要是维护一个visted set和一个frontier set，把这两个分开还是蛮方便的。
## Comment

- Cheapest First Search还是需要练习好的写法

## Code

先把写的比较好的写法放在这里

```python
from heapq import heappush, heappop
class Solution(object):
    def shortestDistance(self, maze, start, destination):
        n, m = len(maze), len(maze[0])
        visited = set()
        queue = []
        direction = [(-1, 0), (1, 0), (0, 1), (0, -1)]
        heappush(queue, (0, start[0], start[1]) )
        while queue:
            length, x, y = heappop(queue)
            if x == destination[0] and y == destination[1]:
                return length
            elif (x, y) not in visited:
                visited.add((x,y))
                for dx, dy in direction:
                    wl, wx, wy = length, x, y
                    while wx + dx >= 0 and wy + dy >= 0 and wx + dx < n and wy + dy < m and maze[wx + dx][wy + dy] == 0:
                        wx = wx + dx
                        wy = wy + dy
                        wl = wl + 1
                    heappush(queue, (wl, wx, wy))
        return -1
```

以下是一个每一次走一步的方法

```python
from heapq import heappush, heappop
class Solution(object):
    def shortestDistance(self, maze, start, destination):
        """
        :type maze: List[List[int]]
        :type start: List[int]
        :type destination: List[int]
        :rtype: int
        """
        n, m = len(maze), len(maze[0])
        visited = set()
        queue = []
        direction = [(-1, 0), (1, 0), (0, 1), (0, -1)]
        for dx, dy in direction:
            heappush(queue, (0, start[0], start[1], dx, dy) )
            visited.add( (start[0], start[1], dx, dy) )
        while queue:
            state = heappop(queue)
            length, x, y, dx, dy = state
            if x + dx < 0 or x + dx >= n or y + dy < 0 or y + dy >= m or maze[x + dx][y + dy] == 1:
                if x == destination[0] and y == destination[1]:
                    return length
                else:
                    for dx, dy in direction:
                        if (x,y, dx, dy) not in visited:
                            visited.add((x,y,dx,dy))
                            heappush(queue, (length, x, y, dx, dy))
            else:
                if (x + dx, y + dy, dx, dy) not in visited:
                    visited.add((x + dx, y + dy, dx, dy))
                    heappush(queue, (length + 1, x + dx, y + dy, dx, dy))
        return -1
```
