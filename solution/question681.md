---
title: Question 681
category: [Data Structure]
tags: [String]
---

![Description](../Assets/Figure/questio681.png)

## Algorithm

- 直接枚举所有可能的结果，然后算经过的时间，并且按照经过的时间排序就好了
- 结果发现更简单的方法是枚举所有时间，也不过就是24*60分钟，也可以用Python的datetime

## Comment

- 换个思路可以简化很多，直接遍历所有时间就好了。

## Code


```python
class Solution:
    def nextClosestTime(self, time):
        """
        :type time: str
        :rtype: str
        """
        minuite_day = 24 * 60
        digit = list(set([x for x in time if x in '0123456789']))
        ans = []
        hh_t = int(time[:2])
        mm_t = int(time[3:])
        for d1 in digit:
            for d2 in digit:
                for d3 in digit:
                    for d4 in digit:
                        hh = int(d1 + d2)
                        mm = int(d3 + d4)
                        if hh >= 0 and hh < 24 and mm >=0 and mm < 60:
                            delta_hh = hh - hh_t
                            delta_mm = mm - mm_t
                            delta = delta_hh * 60 + delta_mm
                            if delta <= 0:
                                delta = delta + minuite_day
                            ans.append( (delta, ':'.join([d1 + d2, d3 + d4])))
        ans.sort(key = lambda x: x[0])
        return ans[0][1]

```

StefanPochmann的这个解非常有意思，这里用了两个细节

1. `False < True`，所以他每一个tuple第一个位置用的是当前时间是不是“早于”给定的时间，如果是`True`，实际上就是下一天的这个时间了，反而要落后于`False`的情况
2. 直接遍历所有时间，看字符是否吻合。`divmod`这个函数有意思。

```python
def nextClosestTime(self, time):
    return min((t <= time, t)
               for i in range(24 * 60)
               for t in ['%02d:%02d' % divmod(i, 60)]
               if set(t) <= set(time))[1]
```
