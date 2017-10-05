---
title: Question 253
category: [Data Structure]
tags: [Heap]
---

![Description](../Assets/Figure/questio253.png)

## Algorithm

- 基本想法是可以用min heap：
  - 对所有的meeting根据开始时间排序
  - 从最早开始的meeting遍历，把它的结束时间作为key值进入heap，维持一个最早结束的meeting的min heap
  - 如果当前heap中的最早结束时间比会议开始时间早，就pop heap，直到heap最早结束时间晚于当前会议开始时间
  - heap最大的时候，就是需要的最多的会议室。
- 当然，[这个想法](https://discuss.leetcode.com/topic/20912/my-python-solution-with-explanation)也非常棒

## Comment

- 要注意的一点是：如果a.end == b.start，这个时候可以使用a的会议室，而不需要新开会议室。

## Code

```python
# Definition for an interval.
# class Interval(object):
#     def __init__(self, s=0, e=0):
#         self.start = s
#         self.end = e
from heapq import heappush, heappop
class Solution(object):
    def minMeetingRooms(self, intervals):
        """
        :type intervals: List[Interval]
        :rtype: int
        """
        intervals.sort(key = lambda x: x.start)
        q = []
        ans = 0
        for interval in intervals:
            heappush(q, interval.end)
            while q and q[0] <= interval.start:
                heappop(q)
            ans = max(ans, len(q))
            #print(q)
        return ans
```
