---
title: Question 315
category: [Data Structure, Algorithm]
tags: [Tree, Merge Sort]
---

![Description](../Assets/Figure/questio315.png)

## Algorithm

- 这是个好题目，StefanPochmann的Merge Sort的方法非常直观，code也写得很好
- 我一开始想的是用BST，但是有一个问题是BST可能会退化成线性，这样的例子很容易构造。如果写平衡树的话又太麻烦了。
- [这里](https://discuss.leetcode.com/topic/33908/3-ways-segment-tree-binary-indexed-tree-binary-search-tree-clean-python-code)一串解非常厉害，尤其是线段树和binary index tree的实现方式值得学习，摘录到下面了。

## Comment

- 数据结构还蛮有意思的。

## Code

StefanPochmann的Merge Sort

```python
def countSmaller(self, nums):
    def sort(enum):
        half = len(enum) / 2
        if half:
            left, right = sort(enum[:half]), sort(enum[half:])
            for i in range(len(enum))[::-1]:
                if not right or left and left[-1][1] > right[-1][1]:
                    smaller[left[-1][0]] += len(right)
                    enum[i] = left.pop()
                else:
                    enum[i] = right.pop()
        return enum
    smaller = [0] * len(nums)
    sort(list(enumerate(nums)))
    return smaller
```

Shiyanhui的Binary Index Tree， 非常漂亮

```python
class BinaryIndexedTree(object):
    def __init__(self, n):
        self.sums = [0] * (n + 1)

    def update(self, i, val):
        while i < len(self.sums):
            self.sums[i] += 1
            i += i & -i

    def sum(self, i):
        r = 0
        while i > 0:
            r += self.sums[i]
            i -= i & -i
        return r


class Solution(object):
    def countSmaller(self, nums):
        hashTable = {v: i for i, v in enumerate(sorted(set(nums)))}
        # 上面的Mapping很重要，减小了数据范围
        tree, r = BinaryIndexedTree(len(hashTable)), []
        for i in xrange(len(nums) - 1, -1, -1):
            r.append(tree.sum(hashTable[nums[i]]))
            tree.update(hashTable[nums[i]] + 1, 1)
        return r[::-1]
```

如果改写成递归的版本，会更短

```python
class BIT(object):
    def __init__(self, n):
        self.ans = [0] * (n + 1)

    def update(self, x, count):
        if x < len(self.ans):
            self.ans[x] += count
            self.update(x + (x & -x), count)

    def sum(self, x):
        return 0 if x == 0 else self.ans[x] + self.sum(x - (x & -x))

class Solution(object):

    def countSmaller(self, nums):
        """
        :type nums: List[int]
        :rtype: List[int]
        """
        hashtable = {v:i for i, v in enumerate(sorted(set(nums)))}
        tree, count = BIT(len(hashtable)), []
        for x in nums[::-1]:
            count.append(tree.sum(hashtable[x]))
            tree.update(hashtable[x] + 1, 1)
        return count[::-1]
```
