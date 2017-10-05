---
title: Question 406
category: [Algorithm]
tags: [sort]
---

![Description](../Assets/Figure/questio406.png)

## Algorithm

- 这个题目也是想法非常有意思
- 首先把所有的人**从高到矮**排序，然后再根据这个人前面有多少个高于TA的人插入到前面的序列中——因为这个时候`people[i]`所在的位置`pos`可以保证前面`pos`个人都比TA高。

## Comment

- [Python Time Complexity](https://wiki.python.org/moin/TimeComplexity)

## Code

From [StefanPochmann](https://discuss.leetcode.com/topic/60550/o-n-sqrt-n-solution)

```python
from heapq import heappop, heappush
class Solution(object):
    def reconstructQueue(self, people):
        """
        :type people: List[List[int]]
        :rtype: List[List[int]]
        """
        people.sort(key=lambda (h, k): (-h, k))
        queue = []
        for p in people:
            queue.insert(p[1], p)
        return queue
```
