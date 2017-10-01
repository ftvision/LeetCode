---
title: Question 689
category: [Algorithm]
tags: [DP]
---

![Description](../Assets/Figure/questio689.png)

## Algorithm

- 这道题目想了好久，最后看别人贴的解真是醍醐灌顶。
- 这个题目要求算三个不同的区间，但是如果能够枚举中间那个区间的话，那么实际上就变成了找这个区间左边的最大区间，这个区间右边的最大区间，然后一并起来，看看结果是不是更大。
- 换句话说就是枚举`mid_range`
  - 给定`mid_range`可以得到max(left | mid_range), max(right | mid_range)
  - 找到`max( mid_range + max(left | mid_range) + max(right | mid_range))`就好了
  - max(left | mid_range)和max(right | mid_range)都可以直接O(n)的时间过一遍，然后存下来。
- 虽然我之前想的办法是`F[i, j]`表示序列到第`i`个数，一共`j`区间，最大的值是多少
  - `F[i, j] = max(F[i - l, j] for l in [1 .. k - 1], F[i - k ,j - 1] + sum(nums[i-k+1:i]) )`
  - 然后还要记录状态的转移，这就涉及到要写一个下表指针，就非常非常麻烦。

## Comment

- 解题思路好的话，可以把题目简化很多啊。

## Code

```python
class Solution:
    def maxSumOfThreeSubarrays(self, nums, k):
        """
        :type nums: List[int]
        :type k: int
        :rtype: List[int]
        """
        n = len(nums)
        #forward part: get max(left | mid_range)
        slide_sum = sum(x for x in nums[:k])
        forward = {k - 1: slide_sum}
        forward_ind = {k - 1: 0}
        for i in range(1, n - k + 1):
            slide_sum = slide_sum - nums[i - 1] + nums[i + k - 1]
            if slide_sum > forward[i + k - 2]:
                forward[i + k - 1] = slide_sum
                forward_ind[i + k - 1] = i
            else:
                forward[i + k - 1] = forward[i + k - 2]
                forward_ind[i + k - 1] = forward_ind[i + k - 2]

        #backward part: get max(right | mid_range)
        slide_sum = sum(x for x in nums[-k:])
        backward = {n - k: slide_sum}
        backward_ind = {n - k: n - k}
        for i in range(n - k)[::-1]:
            slide_sum = slide_sum - nums[i + k] + nums[i]
            if slide_sum > backward[i + 1]:
                backward[i] = slide_sum
                backward_ind[i] = i
            else:
                backward[i] = backward[i + 1]
                backward_ind[i] = backward_ind[i + 1]


        slide_sum = sum(x for x in nums[k-1 : 2*k - 2])
        #iterate through the middle part
        best = 0
        for mid in range(k, n - 2 * k + 1):
            slide_sum = slide_sum - nums[mid - 1] + nums[mid + k - 1]
            if slide_sum + forward[mid - 1] + backward[mid + k] > best:
                best = slide_sum + forward[mid - 1] + backward[mid + k]
                ans = [forward_ind[mid - 1], mid, backward_ind[mid + k]]

        return ans
```
